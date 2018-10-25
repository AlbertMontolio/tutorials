# Chapter 6

# Getting Real: Integration Specs


- By now, we have a solid HTTP routing layer designed with the help of unit specs.

- to write these unit specs, you isolated the code under test.

- Your specs assumed that the underlying dependencies would eventually be implemented

- and provided `test doubles` (fake versions for the test).

Now, time to write these dependencies for real

we will implement the `Ledger` class.

we'll write code to store expense records into a database.

we'll create powerful `integration specs` to make sure the data's really getting stored.

# Hooking up the database

## Getting to know Sequel


We'll use a Ruby database library called Sequel

Allows you to create tables, add data and so on, without tying your code to any specific database product.
we still need to choose a database, we choose the low-maintenance SQLite library

Add following gems in `Gemfile`

```ruby
gem 'sequel', '4.48.0'
gem 'sqlite3', '1.3.13'
```
what we will do with it

- load the sequel library
- create a database connection
- create an `expenses` table so we have a place to store our records
- insert records into the `expenses` table
- query records from the `expenses` table

some sequel in the `irb`

```ruby
>> require 'sequel'
=> true
>> DB = Sequel.sqlite
=> #<Sequel::SQLite::Database: {:adapter=>:sqlite}> >> DB.create_table(:gems) { String :name }
=> nil
>> DB[:gems].insert(name: 'rspec')
=> 1
>> DB[:gems].insert(name: 'sinatra')
=> 2
>> DB[:gems].all
=> [{:name=>"rspec"}, {:name=>"sinatra"}]
```


# Creating a Database

- you want to create separate SQLite databases for testing, development, and production (so that you don't clobber your real data during testing)

We use an environment variable to configure separate databases.

Create following file

expense_tracker/config/sequel.rb

```ruby
require 'sequel'
DB = Sequel.sqlite("./db/#{ENV.fetch('RACK_ENV', 'development')}.db")
```

This will create a database file such as `db/test.db` or `db/production` depending on the RACK_ENV environment variable.

Structure of our data

- a unique ID
- name of the payee
- amount
- date

We'll use a Sequel migration to create the table structure that holds this information.

expense_tracker/db/migrations/0001_create_expenses.rb

```ruby
Sequel.migration do
  change do
    create_table :expenses do
      primary_key :id
      String :payee
      Float :amount
      Date :date
    end
  end
end
```


to run the migration

```ruby
bundle exec sequel -m ./db/migrations sqlite://db/development.db --echo
```

now that we've configured Sequel, it's time to write some specs.

# Testing Ledger Behavior

We've seen how to run Sequel migrations manually from the command line.
We configure now RSpec to run them automatically, so that the database structure is in place before your first integration spec runs.

```ruby
Sequel.extension :migration
Sequel::Migrator.run(DB, 'db/migrations')
DB[:expenses].truncate
```


Where do we put this code?

we put it in a folder called `spec/support`

Then we can load it from whatever spec files need it.

create new file

/expense_tracker/spec/support/db.rb

```ruby
RSpec.configure do |c|
  c.before(:suite) do
    Sequel.extension :migration
    Sequel::Migrator.run(DB, 'db/migrations')
    DB[:expenses].truncate
  end
end
```

- before(:suite) run just once: after all the specs have been loaded, but before the first one actually runs.


Now that we have defined our hook, we are ready to define our spec and load the support file.

create

spec/integration/app/ledger_spec.rb

```ruby
require_relative '../../../app/ledger'
require_relative '../../../config/sequel'
require_relative '../../support/db'

module ExpenseTracker
  RSpec.describe Ledger do
    let(:ledger) { Ledger.new }
    let(:expense) do
      {
        'payee' => 'Starbucsk',
        'amount' => 5.75,
        'date' => '2017-06-10'
      }
    end

    describe '#record' do
      # ... contexts go here ...
    end
  end

end
```


the `:ledger` and `:expense` setup will be the same for each example, so we've used `let` to initialize this data.

now, we want to tell the ledger to save the expense, and then actually read the database from disk and make sure the expense really got saved.

spec/integration/app/ledger_spec.rb

```ruby
context 'with a valid expense' do
  it 'successfully saves the expense in the DB' do
    result = ledger.record(expense)

    expect(result).to be_success
    expect(DB[:expenses].all).to match [a_hash_including(
      id: result.expense_id,
      payee: 'Starbucks',
      amount: 5.75,
      date: Date.iso8601('2017-06-10')
    )]
  end
end
```

New matchers:

`be_success` checks that `result.success?` is true

`match[a_hash_including(...)]` expects our app to return data matching a certain structure

In this case, a one-element array of hashes with certain keys and values.

This expression is another use of RSpec's `composable_matchers`, here we are passing the `a_hash_including` matcher into the `match` one.

run the spec

```ruby
bundle exec rspec spec/integration/app/ledger_spec.rb
```

the spec fails

```ruby
ExpenseTracker::Ledger
  #record
    with a valid expense
      successfully saves the expense in the DB (FAILED - 1)

Failures:

  1) ExpenseTracker::Ledger#record with a valid expense successfully saves the expense in the DB
     Failure/Error: expect(result).to be_success
       expected nil to respond to `success?`
     # ./spec/integration/app/ledger_spec.rb:21:in `block (4 levels) in <module:ExpenseTracker>'
```

we don't see the second failure, because RSpec stops by default

We can see it with the tag

```ruby
it 'successfully saves the expense in the DB', :aggregate_failures do
```

Move the flag to

```ruby
  RSpec.describe Ledger, :aggregate_failures do
```

Time to fill in the behavior

expense_tracker/app/ledger.rb

```ruby
def record(expense)
  DB[:expenses].insert(expense)
  id = DB[:expenses].max(:id)
  RecordResult.new(true, id, nil)
end
```

spec passes

# Testing the invalid case

spec for an expense missing a payee

spec/integration/app/ledger_spec.rb

```ruby
context 'when the expense lacks a payee' do
  it 'rejects the expense as invalid' do
    expense.delete('payee')

    result = ledger.record(expense)

    expect(result).not_to be_success
    expect(result.expense_id).to eq(nil)
    expect(result.error_message).to include('`payee`is required')

    expect(DB[:expenses].count).to eq(0)
  end
end
```

run the specs

errors, RSpec runs the specs in random order.

If you want to run the specs in the previous order of the last run, check out

```ruby
Randomized with seed 42500
```

and write

```ruby
bundle exec rspec --sed 42500
```

With the `--bisect` option, RSpec will systematically run different portions of your suite until it finds the smallest set that triggers a failure

```ruby
bundle exec rspec --bisect --seed 42500
```

```ruby
Bisect started using options: "--seed 42500"
Running suite to find failures... (0.66954 seconds)
Starting bisect with 1 failing example and 10 non-failing examples.
Checking that failure(s) are order-dependent... failure(s) do not require any non-failures to run first

Bisect complete! Reduced necessary non-failing examples from 10 to 0 in 0.47262 seconds.

The minimal reproduction command is:
  rspec './spec/integration/app/ledger_spec.rb[1:1:2:1]' --seed 42500
```

run this command

```ruby
rspec './spec/integration/app/ledger_spec.rb[1:1:2:1]' --seed 42500
```

# Isolating your specs using database transactions

To solve this issue, we're going to wrap each spec in a database transaction.

After each example runs, we want RSpec to roll back the transaction, canceling any writes that happened and leaving the database in a clean state.

An RSpec `around` hook would be perfect for this task. You already have a `spec/support/db.rb` file for database support code, so add it there, inside the `RSpec.configure` block:


expense_tracker/spec/support/db.rb

```ruby
c.around(:example, :db) do |example|
  DB.transaction(rollback: :always) { example.run }
end
```

1 - RSpec calls our `around` hook, passing it the example we're running
2 - Inside the hook, we tell Sequel to start a new database transaction
3 - Sequel calls the inner block, in which we tell RSpec to run the example.
4 - The body of the example finishes running
5 - Sequel rolls back the transaction, wiping out any changes we made to the database.
6 - The `around` hook finishes, and RSpec moves on to the next example.

now we use `:db` symbol to indicate that an example touches the database:

expense_tracker/spec/integration/an_integration_spec.rb

```ruby
require_relative '../support/db'

RSpec.describe 'An integration spec', :db do

end
```
we had to do two things

- explicitely load the setup code from `support/db`
- Tag the example grou with `:db`

RSpec has an option to tag the database-related example grous with `:db` and trust that the support code will be loaded as needed.

```ruby
expense_tracker/spec/spec_helper.rb

RSpec.configure do |config|
  config.when_first_matching_example_defined(:db) do
    require_relative 'support/db'
  end
end
```

With that hook in place, RSpec will conditionally load `spec/support/db.rb` if (and only if) any examples are loaded that have a `:db` tag.

Now, let's add the `:db` tag in our acceptance and integration test

spec/acceptance/expense_tracker_api_spec.rb

```ruby
RSpec.describe 'Expense Tracker API', :db do
```

next, spec/integration/app/ledger_spec.rb

```ruby
RSpec.describe Ledger, :aggregate_failures, :db do
```

you can remove the line `../../support/db`

run

```ruby
bundle exec rspec --seed 4500
```


# Filling in the behavior

The failing spec is expecting the `Ledger` class's `record` method to return error information if we pass in an invalidad expense (one with no payee defined)

expense_tracker/app/ledger.rb

```ruby
module ExpenseTracker
  RecordResult = Struct.new(:success?, :expense_id, :error_message)

  class Ledger
    def record(expense)
      unless expense.key?('payee')
        message = 'Invalid expense: `payee` is required'
        return RecordResult.new(false, nil, message)
      end

      DB[:expenses].insert(expense)
      id = DB[:expenses].max(:id)
      RecordResult.new(true, id, nil)
    end

    def expenses_on(date)
    end
  end
end
```

run the specs

```ruby
bundle exec rspec spec/integration/app/ledger_spec.rb
```

well done! we've implemented saving a single expense at all layers of the app, from top to bottom.

# Querying expenses

First, we need a failing spec that records a few expenses into the ledger, with some of the expenses on the same date.

spec/integration/app/ledger_spec.rb

```ruby
describe '#expenses_on' do
  it 'returns all expenses for the provided date' do
    result_1 = ledger.record(expense.merge('date' => '2017-06-10'))
    result_2 = ledger.record(expense.merge('date' => '2017-06-10'))
    result_3 = ledger.record(expense.merge('date' => '2017-06-11'))

    expect(ledger.expenses_on('2017-06-10')).to contain_exactly(
      a_hash_including(id: result_1.expense_id),
      a_hash_including(id: result_2.expense_id),
    )
  end

  it 'returns a blank array when there are no matching expenses' do
    expect(ledger.expenses_on('2017-06-10')).to eq([])
  end
end
```

The overall flow (adding three expenses and then searching for two of them by date) looks similar to what we did in the acceptance spec. Here, we are testing at the level of the individual `Ledger` object, rather than the entire app.

let's implement the method `expenses_on(date)`

/expense_tracker/app/ledger.rb

```ruby
def expenses_on(date)
  DB[:expenses].where(date: date).all
end
```

all good

At this point, all the logic and specs are implemented at every layer of the app. It's time to see if our outermost acceptance spec passes yet

```ruby
bundle exec rspec
```

in expense_tracker_api_spec.rb we had a pending

```ruby
    it 'records submitted expenses' do
      # pending 'Need to persist expenses'
```

Be careful to just post once, comment out if you have multiple posts, since you will repeat the id



# Ensuring the Application works for real

let's try the app by hand

```ruby
bundle exec rackup
```

try to hit an endpoint

```ruby
curl localhost:9292/expenses/2017-06-10 -w "\n"
```

error, uninitialized constat sequel

You can use a text search tool like grep to find where this file is being loaded in the application.

```ruby
grep config/sequel -r . --exclude-dir=.git
```

```ruby
./app/ledger.rb:require_relative '../config/sequel'
./spec/integration/app/ledger_spec.rb:require_relative '../../../config/sequel'
```

lets load the config from ledger.rb

app/ledger.rb

```ruby
require_relative '../config/sequel'
```


































































































