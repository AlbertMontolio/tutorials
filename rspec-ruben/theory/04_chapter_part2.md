Part II Building an App With RSpec 3

# Chapter 04: Starting on the outside: acceptance specs

write a real app, we starte with acceptance specs.

# First steps

we will do outside-in development. first we design the app, what the user wants, and then we dive in into classes, methods

# The project: An expense tracker

customers will use some kind of client software --command-line app, a GUI, or even a web app-- to track and report their daily expenses


here are the major parts of the app

- a web application written in sinatra that will receive incoming HTTP requests (to add new expenses or search for existing ones)
- a database layer using Sequel to store expenses between requests
- a set of ruby objects to represent expenses and glue the other pieces together

HTTP-Request -> HTTP Routing code (your sinatra routes) -> expense logic (your ruby code) -> adapter (sequel) -> database (SQlite)

> Acceptance specs exercise ALL the layers

# Start

- create directory `expense_tracker`

```ruby
gem install bundler
```

```ruby
bundle init
```

writes a new Gemfile

4 libraries

- RSpec to test our project
- Coderay for easy-to-read, syntax-highlighted failure output
- Rack::Test to provide an PI for driving web services from tests
- Sinatra to implement the web application; its light footprint and simple API are a good fit for this project


Gemfile

```ruby
# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
gem 'rspec', '3.6.0'
gem 'coderay', '1.1.1'
gem 'rack-test', '0.7.0'
gem 'sinatra', '2.0.0'
```

```ruby
bundle install
```

to run the specs, we will use

```ruby
bundle exec rspec --init
```

this command generates two files:

- .rspec, which contains default command-line flags
- spec/spec_helper.rb, which contains configuraiton options

.rspec contains:

```ruby
--require spec_helper
```

this causes to load the spec_helper.rb file for us before loading and running our spec files

add this line to `spec/spec_helper`

```ruby
ENV['RACK_ENV'] = 'test'
```

```ruby
Setting the RACK_ENV environment variable to test switches on test- friendly behavior in your web framework. Sinatra normally swal- lows exceptions and renders a “500 Internal Server Error” response. With this variable set, Sinatra will instead allow errors to bubble up to your test framework.
```

# Deciding what to test first

core? save the expenses we record

create file

spec/acceptance/expense_tracker_api_spec.rb

```ruby
require 'rack/test'
require 'json'

module ExpenseTracker
  RSpec.describe 'Expense Tracker API' do
    include Rack::Test::Methods

    it 'records submitted expenses' do
      coffee = {
        'payee' => 'Starbucks',
        'amount' => 5.75,
        'date' => '2017-06-10'
      }

    post '/expenses', JSON.generate(coffee)
    end

  end

end
```

Note that we can nest RSpec contexts inside modules. In our codebase, we'll enclose both our app and our specs inside the `ExpenseTracker` module so that we have easy access to all the classes defined by our app.

!!! to represent money we use weather BigDecimal class or a currency library like the Money gem.

we will be posting some key-value pairs to the /expenses endpoint

our expense tracker API is built on Hypertext Transfer Protocol (HTTP).

In our case, the request will be coming from a command-line program, a desktop GUI, or a set of RSpec examples.

# Rack

To get the data into and out of our app, we will use several different helper methods from Rack::Test::Methods

## the first helper will be `post`

This will simulate an HTTP POST request

lets run the app first.

```ruby
bundle exec rspec
```

```ruby
Expense Tracker API
  records submitted expenses (FAILED - 1)

Failures:

  1) Expense Tracker API records submitted expenses
     Failure/Error: post '/expenses', JSON.generate(coffee)

     NameError:
       undefined local variable or method `app' for #<RSpec::ExampleGroups::ExpenseTrackerAPI:0x00007fbf2ec7d0b8>
     # ./spec/acceptance/expense_tracker_api_spec.rb:14:in `block (2 levels) in <module:ExpenseTracker>'

Finished in 0.00246 seconds (files took 0.12349 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/acceptance/expense_tracker_api_spec.rb:8 # Expense Tracker API records submitted expenses
```

This error message, and teh Rack::Test documentation, tell us that our test suite needs to define an app method that returns an object representing our web app !!!

```ruby
module ExpenseTracker
  RSpec.describe 'Expense Tracker API' do
    include Rack::Test::Methods

    def app
      ExpenseTracker::API.new
    end

    it 'records submitted expenses' do

  [...]
```

context are normal Ruby classes, so we can define helper methods

run the specs

```ruby
Failures:

  1) Expense Tracker API records submitted expenses
     Failure/Error: ExpenseTracker::API.new

     NameError:
       uninitialized constant ExpenseTracker::API
```


We haven't defined the class yet. Let's do so

create

```ruby
expense_tracker/app/api.rb
```

add

```ruby
require 'sinatra/base'
require 'json'

module ExpenseTracker
  class API < Sinatra::base

  end
end
```

our test needs to load this

so, in our spec, at the top

```ruby
require_relative '../../app/api.rb'
```

our test pass, we are only verifying that the POST rquest completes without crashing the app. later on we check that ge get a valig response back from the app

# Checking the Response

Rack::Test provides the `last_response` method for checking HTTP responses.

in the spec, right after the post request:

```ruby
post '/expenses', JSON.generate(coffee)
expect(last_response.status).to eq(200)
```
another expectation

we create a matcher using eq.

indicates whether or not the value wrapped by `expect` equals the provided argument of 200

Failures

```ruby
expected: 200
got: 404
```

our app returns not found (404. we don't have any routes in our sinatra code yet

in api.rb

```ruby
post '/expenses' do

end
```

```ruby
require 'sinatra/base'
require 'json'

module ExpenseTracker
  class API < Sinatra::Base
    post '/expenses' do
    end
  end
end
```

# Filling in the response body

what do we want as a response? the id of the record we saved

let's return a json object:

```js
{ "expense_id": 42 }
```

Ruby's JSON library can parse this into a Ruby hash

```ruby
require 'json'
JSON.parse({ "expense_id": 42 })
{"expense_id"=>42}
```

```ruby
post '/expenses', JSON.generate(coffee)
expect(last_response.status).to eq(200)

parsed = JSON.parse(last_response.body)
expect(parsed).to include('expense_id' => a_kind_of(Integer))
```

`include` and `a_kind_of` are matchers

run specs

```ruby
JSON::ParserError:
751: unexpected token at ''
```

we are sending back an empty string. we need to send back a json

```ruby
post '/expenses' do
  JSON.generate('expense_id' => 42)
end
```

specs pass

# Querying the Data

we want to retreive expenses. by date. so lets post a few expenses with different dates

posting one expense after another will get really old if we have to keep repeating all that code. Let's extract that helper logic into a `post_expense` helper method

inside the `RSpec.describe` block

```ruby
def post_expense(expense)
  post '/expenses', JSON.generate(expense)
  expect(last_response.status).to eq(200)

  parsed = JSON.parse(last_response.body)
  expect(parsed).to include('expense_id' => a_kind_of(Integer))
  expense.merge('id' => parsed['expense_id'])
end
```

the merge, adds a key to the hash, containing whatever ID gets auto-assigned from the database


coffee is now so:

```ruby
coffee = post_expense({
  'payee' => 'Starbucks',
  'amount' => 5.75,
  'date' => '2017-06-10'
})
```

more expenses

```ruby
zoo = post_expense({
  'payee' => 'Zoo',
  'amount' => 15.25,
  'date' => '2017-06-10'
})

groceries = post_expense({
  'payee' => 'Whole Foods',
  'amount' => 95.20,
  'date' => '2017-06-11'
})
```

```ruby
it 'records submitted expenses' do
  # POST coffee, zoo, and groceries expenses here

  get '/expenses/2017-06-10'
  expect(last_response.status).to eq(200)

  expenses = JSON.parse(last_response.body)
  expect(expenses).to contain_exactly(coffee, zoo)
end
```

!!! `contain_exactly` is a matcher

The contain_exactly matcher provides a way to test arrays against each other in a way
that disregards differences in the ordering between the actual and expected array.
For example:

```ruby
expect([1, 2, 3]).to    contain_exactly(2, 3, 1) # pass
expect([:a, :c, :b]).to contain_exactly(:a, :c ) # fail
```

If  the order matters, we sould use `eq`.

run the specs

```ruby
bundle exec rspec
```

result

```ruby
1) Expense Tracker API records submitted expenses
     Failure/Error: expect(last_response.status).to eq(200)

       expected: 200
            got: 404
```


lets add a route that returns an empty JSON array

```ruby
get '/expenses/:date' do
  JSON.generate([])
end
```

run specs

results

```ruby
1) Expense Tracker API records submitted expenses
     Failure/Error: expect(expenses).to contain_exactly(coffee, zoo)

       expected collection contained:  [{"payee"=>"Starbucks", "amount"=>5.75, "date"=>"2017-06-10", "id"=>42}, {"payee"=>"Zoo", "amount"=>15.25, "date"=>"2017-06-10", "id"=>42}]
       actual collection contained:    []
       the missing elements were:      [{"payee"=>"Starbucks", "amount"=>5.75, "date"=>"2017-06-10", "id"=>42}, {"payee"=>"Zoo", "amount"=>15.25, "date"=>"2017-06-10", "id"=>42}]
```

we need to write some code in our route to pass the spec, but not now

# Saving your progress: pending specs

lets mark this spec as in progress

```ruby
it 'records submitted expenses' do
  pending 'Need to persist expenses'
```
let's hook our application up to a web server so we can actually see it working.

# Rack

Rack, the HTTP toolkit that Sinatra is built on top of, ships with a tool named rackup that makes it easy to run any Rack application (including apps built using Sinatra). We just need to define a rackup config file named `config.ru`with the following contents:

expense_tracker/config.ru

```ruby
require_relative 'app/api'
run ExpenseTracker::API.new
```

We load our application and tell Rack to run it

we can boot our application by running

```ruby
rackup
```

```ruby
Puma starting in single mode...
* Version 3.12.0 (ruby 2.4.4-p296), codename: Llamas in Pajamas
* Min threads: 0, max threads: 16
* Environment: development
* Listening on tcp://localhost:9292
Use Ctrl-C to stop
```

let's use a command-line tool like `curl` in another terminal. let's send a request

```ruby
curl localhost:9292/expenses/207-06-10 -w "\n"
```

it gives us back an empty array

```ruby
[]
```

!!! dive in

- introductory Sinatra documentation

- read "testing sinatra with Rack::Test", testing approach favored by the Sinatra team

- play with the config in `spec_helper.rb`























































































