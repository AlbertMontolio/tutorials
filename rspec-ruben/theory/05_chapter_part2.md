# Chapter 5: Testing in Isolation: Unit Specs

We finished off the last chapter with a working acceptance `spec`.
This spec is correctly reporting that the underlying logic isn't implemented yet

Now we are going to start filling in the application skeleton with a working implementation now, picking up where you left off: the HTTP routing layer.

When we finish this chapter and the exercises, you'll have a complete set of passing unit specs for your HTTP layer.

# Unit test

typically involve isolating a class or method from the rest of the code.

Where unit testing approaches differ is the degree of isolation.

!!! Xavier Shay’s article, “How I Test Rails Applications

Unit test

“A test is not a unit test if it talks to the database, communicates across a network, or touches the file system.”

Full system testing was popularized by the cucumber library

RSpec can easily be written in a BDD style without extra libraries.

An acceptance test will typically take seconds to run, and should only be used for happy-path verification of behaviour

https://rhnh.net/2012/12/20/how-i-test-rails-applications/


# A better testing experience

let's configure RSpec for the task at hand

in spec_helper.rb

delete the comments `=begin`

comment out following

```ruby
  # config.warnings = true
```

useful when testing slow specs

```ruby
  # config.profile_examples = 10
```

add in the

```ruby
RSpec.configure do |config|
  config.filter_gems_from_backtrace 'rack', 'rack-test', 'sequel', 'sinatra'
```

gets rid of dozens of line of framework code when reading the failures

if you want to see the full backtracke

```ruby
--backtrace
```

or

```ruby
-b
```

# Sketching the Behavior

we want to see what happens when an API call succeeds and when it fails.

> Unit tests' speed and simplicity make them the perfect place to test all your conditional branches and edge cases. Exhaustively covering all the cases in a slower integration or acceptance test tends to be too inefficient.


start by sketching out the success case. Create new file

spec/unit/app/api_spec.rb

```ruby
require_relative '../../../app/api'

module ExpenseTracker
  RSpec.describe API do
    describe 'POST /expenses' do
      context 'when the expense is successfully recorded' do
        it 'returns the expense id'
        it 'responds with a 200 (OK)'
      end
    end
  end
end
```

now second context, this one will handle the failure case

```ruby
context 'when the expense fails validation' do
  it 'returns an error message'
  it 'responds with a 422 (Unprocessable entity'
end
```

run the test

```ruby
bundle exec rspec spec/unit/app/api_spec.rb
```

time to fill the behaviour!

# Filling in the first spec

for the API class, create a Ledger (libro de contabilidad)

```ruby
class API < Sinatra::Base
  def initialize
    @ledger = Ledger.new
    super() # rest of initialization from Sinatra
  end
end

# Later, callers do this:
app = API.new
```

But this style limits the code's flexibility and testability, as it doesn't allow you to use a substitute ledger for custom behavior. Instead, consider structuring the code so that callers pass an object filling the `Ledger`role into the API initializer:

```ruby
class API < Sinatra::Base
  def initialize(ledger:)
    @ledger = ledger
    super()
  end
end

# Later, callers do this:
app = API.new(ledger: Ledger.new)
```

This techniche is called dependency injection (DI for short).

if we don't want to pass a paramter, we can set a value

```ruby
class API < Sinatra::Base
  def initialize(ledger: Ledger.new)
    @ledger = ledger
    super()
  end
end

# Later, callers do this:
app = API.new(ledger: Ledger.new)
```


```ruby
# Pseudocode for what happens inside the API class:
#
result = @ledger.record({ 'some' => 'data' })
result.success?       # => a Boolean
result.expense_id     # => a number
result.error_message  # => a string or nil
```

We don't write the `Ledger` class yet. We are not testing its behavior here; we are testing the API class.

Instead, we will need something to stand in for a `Ledger` isntance. Speficically, you'll need a `test double`.

# Test doubles: mocks, stubs, and others.

A test double is an object that stands in for another one during a test. Testers tend to refer to them as mocks, stubs, fakes, or spies.
RSpec supports all of these uses under the umbrella term `doubles`


- create stand-in for an instance of a class with `instance_double`, pass the name of the class you're imitating (does not exist yet).

- define it with `let` construct since, we need access to this instance from all the specs

spec/unit/app/api_spec.rb

```ruby
require_relative '../../../app/api'
require 'rack/test'

module ExpenseTracker
  RecordResult = Struct.new(:success?, :expense_id, :error_message)

  RSpec.describe API do

    include Rack::Test::Methods

    def app
      API.new(ledger: ledger)
    end

    let(:ledger) { instance_double('ExpenseTracker::Ledger') }

    describe 'POST /expenses' do
      context 'when the expense is successfully recorded' do
        # ... specs go here ...
      end

      context 'when the expense fails validation' do
        # ... specs go here ...
      end
    end

  end
end
```

>We use Rack::Test to route HTTP request to the API class

- We pack up the status information in a simple RecordResult class.

spec/unit/app/api_spec.rb

```ruby
it 'returns the expense id' do
  expense = { 'some' => 'data' }

  allow(ledger).to receive(:record)
    .with(expense)
    .and_return(RecordResult.new(true, 417, nil))

  post '/expenses', JSON.generate(expense)

  parsed = JSON.parse(last_response.body)
  expect(parsed).to include('expense_id' => 417)
end
```

!!! `allow` methdo from `rspec-mocks`

This method configures the test double's behavior: when the caller (the API class) invokes `record`, the double will return a new `RecordResult` instance indicating a successful posting.

The `expense`hash has no valid data. It's ok, in the live app will do. We just focus on the response now

run the specs, they will fail

```ruby
bundle exec rspec spec/unit/app/api_spec.rb
```

now lets fill in the implementation

# Handling Success

To pass this spec, the `/expenses` route of our API needs to do three things:

- parse an expense from the request body
- use its `Ledger` (iether a real database-based one or a fake on for testing) to `record` the expense
- Return a JSON documenet containing the resulting expense ID

in app/api.rb

```ruby
post '/expenses' do
  expense = JSON.parse(request.body.read)
  result = @ledger.record(expense)
  JSON.generate('expense_id' => result.expense_id)
end
```


Inspecting:

```ruby
p @ledger
#<InstanceDouble(ExpenseTracker::Ledger) (anonymous)>
```

```ruby
p @ledger.record(expense)
#<struct ExpenseTracker::RecordResult :success?=true, expense_id=417, error_message=nil>
```

now that we know that the app is returning the expense ID correctly, let's move on to the next bit of behavior

## Rendering the correct HTTP status code.

/spec/unit/app/api_spec.rb

```ruby
it 'responds with a 200 (OK)' do
  expense = { 'some' => 'data' }

  allow(ledger).to receive(:record)
    .with(expense)
    .and_return(RecordResult.new(true, 417, nil))

  post '/expenses', JSON.generate(expense)
  expect(last_response.status).to eq(200)
end
```

and it passes

let's break the app to see if this test is actually working

```ruby
post '/expenses' do
  status 404
```

and it fails, good

```ruby
1) ExpenseTracker::API POST /expenses when the expense is successfully recorded responds with a 200 (OK)
     Failure/Error: expect(last_response.status).to eq(200)

       expected: 200
            got: 404
```

let's turn back our attention to test maintainability.

There is a lot of duplicated code in these two test cases.

# Refactoring

Both test cases have identical expressions setting up the `ledger` test double.


!!! read book: the pragmatic programmer!

# Handling Failure

Now our specs are testing the "happy path". let's do the failure case

/spec/unit/app/api_spec.rb

```ruby
context 'when the expense fails validation' do
  let(:expense) { { 'some' => 'data' } }

  before do
    allow(ledger).to receive(:record)
      .with(expense)
      .and_return(RecordResult.new(false, 417, 'Expense incomplete'))
  end

  it 'returns an error message' do
    post '/expenses', JSON.generate(expense)

    parsed = JSON.parse(last_response.body)
    expect(parsed).to include('error' => 'Expense incomplete')
  end

  it 'responds with a 422 (Unprocessable entity' do
    post '/expenses', JSON.generate(expense)
    expect(last_response.status).to eq(422)
  end
end
```

expectations are different, test fail

The POST route needs to check the success? flag of the RecordResult and set the HTTP status and body accordingly.

app/api.rb

```ruby
post '/expenses' do
  expense = JSON.parse(request.body.read)
  result = @ledger.record(expense)

  if result.success?
    JSON.generate('expense_id' => result.expense_id)
  else
    status 422
    JSON.generate('error' => result.error_message)
  end
end
```

all the specs pass :)

Before we finish off this chapter, let's sketch out the `Ledger` class.

Until here, we've been testing the responsose of the requests

# Defining the Ledger

In working directory, create

expense_tracker/app/ledger.rb

```ruby
module ExpenseTracker
  RecordResult = Struct.new(:success?, :expense_id, :error_message)

  class Ledger

  end
end
```

Delete the RecordResult definition from `spec/unit/app/api_spec.rb`

rquire this new file / class in app/api.rb

```ruby
require_relative 'ledger'
```

The specs that we have are still using the fake ledger.

if we run the specs again, all fail

```ruby
Failures:

  1) ExpenseTracker::API POST /expenses when the expense fails validation responds with a 422 (Unprocessable entity
     Failure/Error:
       allow(ledger).to receive(:record)
         .with(expense)
         .and_return(RecordResult.new(false, 417, 'Expense incomplete'))

       the ExpenseTracker::Ledger class does not implement the instance method: record
     # ./spec/unit/app/api_spec.rb:45:in `block (4 levels) in <module:ExpenseTracker>'
```


The real `Ledger` class doesn't act enough like the fake one.

Let's add an empty `record` method to `Ledger`

```ruby
def record

end
```

now we have as error

```ruby
1) ExpenseTracker::API POST /expenses when the expense fails validation returns an error message
     Failure/Error:
       allow(ledger).to receive(:record)
         .with(expense)
         .and_return(RecordResult.new(false, 417, 'Expense incomplete'))

       Wrong number of arguments. Expected 0, got 1.
     # ./spec/unit/app/api_spec.rb:45:in `block (4 levels) in <module:ExpenseTracker>'
```

RSpec sees the new `record` method, but points out that it doesn't take an argument like the test double does.

app/ledger.rb

```ruby
def record(expense)
end
```

now all good.

In the next chapter, you'll fill in the behavior behind the interface

we've spelled out what happens when storing an expense record succeeds or fails, using a test double to stand in for the unwritten persistence layer.



# Implementing the GET Route

The goal is to be able to hit a URL containing a date:

```ruby
get '/expenses/2017-06-12'
```

/spec/unit/app/api_spec.rb

```ruby
describe 'GET /expenses/:date' do
  context 'when expenses exist on the given date' do
    it 'returns the expense records as JSON'
    it 'responds with a 200 (OK)'
  end

  context 'when there are no expenses on the given date' do
    it 'returns an empty array as JSON'
    it 'respodns with a 200 (OK)'
  end
end
```

unit/app/api_spec.rb

```ruby
describe 'GET /expenses/:date' do
  context 'when expenses exist on the given date' do

    before do
      allow(ledger).to receive(:expenses_on)
        .with('2017-06-12')
        .and_return(['expense_1', 'expense_2'])
    end

    it 'returns the expense records as JSON' do
      get 'expenses/2017-06-12'
      parsed = JSON.parse(last_response.body)
      expect(parsed).to eq(['expense_1', 'expense_2'])
    end
```

api.rb

```ruby
get '/expenses/:date' do
  date = params[:date]
  JSON.generate(@ledger.expenses_on(date))
end
```

```ruby
module ExpenseTracker
  RecordResult = Struct.new(:success?, :expense_id, :error_message)

  class Ledger
    def record(expense)
    end

    def expenses_on(date)
    end
  end
end
```

api_spec.rb

```ruby
it 'responds with a 200 (OK)' do
  get 'expenses/2017-06-12'
  expect(last_response.status).to eq(200)
end
```

```ruby
context 'when there are no expenses on the given date' do

  before do
    allow(ledger).to receive(:expenses_on)
      .with('2017-06-12')
      .and_return([])
  end

  it 'returns an empty array as JSON' do
    get 'expenses/2017-06-12'
    parsed = JSON.parse(last_response.body)
    expect(parsed).to eq([])

  end
  it 'respodns with a 200 (OK)' do
    get 'expenses/2017-06-12'
    p last_response
    p "uaaaaa"
    expect(last_response.status).to eq(200)
  end
end
```





























































