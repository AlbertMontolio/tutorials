# Using RSpec with rails

!!! Rails 4 Test prescriptions: build a healthy codebase

if you use lewagon template, change config from unit_test to rspec

config /application.rb

```ruby
module RspecTestingRailsss
  class Application < Rails::Application
    config.generators do |generate|
          generate.assets false
          generate.helper false
          # generate.test_framework  :test_unit, fixture: false
          generate.test_framework  :rspec
        end
```

# Installation

Rails provides infrastructure for directly testing specific pieces of your application: models, views, controllers. It also supports tests that integrate multiple layers and acceptance tests that integrate all layers.

in the Gemfile

```ruby
group :development, :test do
  gem 'rspec-rails', '~> 3.6'
end
```

```ruby
bundle install
```

```ruby
rails generate rspec:install
```

```ruby
Running via Spring preloader in process 45740
      create  .rspec
      create  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb
```

# Using rspec-rails

we can run our spec suite using:

```ruby
bundle exec rspec
```

or

```ruby
bin/rake spec
```

> Commands in the `bin` directory, like `rake` or `rails`, are Rails-generated binstubs (wrapper scripts) that save you the hassle of remembering to type `bundle exec` before every command.


When you generate a Rails object such as a controller or scaffold, RSpec will create a corresponding spec file for you

```ruby
rails generate model pterodactyl
```

```ruby
Running via Spring preloader in process 46014
      invoke  active_record
      create    db/migrate/20180928024032_create_pterodactyls.rb
      create    app/models/pterodactyl.rb
      invoke    test_unit
      create      test/models/pterodactyl_test.rb
```

you can also generate just the spec file.

just prepend `rspec`

```ruby
rails generate rspec:model pterodactyl
```

let's take a look at the different types of specs you might write to test your Rails app.

# Spec Types

in the expense tracker API, we built 3 different kinds of specs

- acceptance specs to test the entire app end to end
- unit specs to test one layer in isolation
- integration specs to test objects with real collaborators and external services

a rails app is more complex than a tiny API. Accordingly, Rails provides infraestructure for several different kinds of tests, including the following ones:

- integration tests that drive your app as a black box via its HTTP interface.
- Functional tests to see how your controllers respond to requests
- Unit tests to drive a single object or layer
- Specific tests for models, mailers, and background jobs; any given test here may be a unit or integration test.

We tag our example group with the `:type` metadata, passing it one of the spec types (:model, :request, :helper, and so on)

In the model that we created:

```ruby
require 'rails_helper'

RSpec.describe Pterodactyl, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
```

look the type: :model

:request and :model will be very often

# Spec types cheat Sheet

Spec type :feature

Use for: testing the entire app, including the in-browser UI, via Capybara

What it provides
- feature/scenario aliases for describe/it
- access to the Capybara API, including `visit`, `fill_in` and so on
- Named route helpers of the form `some_route_path`

Notes
- Requires the Capybara gem


---------------------------------

Spec type :request

Use for:
- non-java-script interactions, such as APIs
- exercising all layers of your Ruby code
- multiple requests, controllers, sessions

What it provides
- request helpers like get '/index', post '/create'
- rquest matchers, see Rails matchers Cheat Sheet, on page 304
- Named route helpers of the form `some_routh_path`

Notes:
- Uses the Rails router and Rack middleware stack
- Similar to the acceptance specs you wrote for the expense tracker API

--------------------------------

Spec type :model

Use for:
- testing your activerecord modles

What it provides
- database transactions and model fixtures (available for all spec types, but more relevant here)

--------------------------------

Spec type :controller

Use for:
- testing controllers in isolation

What it provides
- request helperes like `get :index`, `post :create`
- controller matchers; see Rails matchers cheat sheet, on page 304
- `controller` to define an anonymous controller

- `route` to use a different route set

- `bypass_rescue` to prevent converting errors to 500 responses

- named route helpers of the form `some_route_path`

Notes
- Bypasses Rack middleware
- By design, does not render views by default; call `render_views` if you need this behavior

-----------------------------

Spec type :view

Use for
- testing the HTML contents of your views

What it provides
- assign to make instance variables available

--------------------

Spec type :helper
- testing view helper modules in app/helpers

what it provides:
- assign to make instance variables available
- `helper.some_method` to call methods from the helper module you're testing

--------

Spec type :mailer

use for
- testing rails mailers

What it provides
- named route helpers of the form `some_routh_path`

------

spec type :routing

use for
- checking that URLs route to specific controller actions

what it provides
- routing matchers, see Rails Matcheres Cheat Sheet, on page 304
- named route helpers of the form `some_route_path`

spec type :job

use for
- testing background jobs

what it provides:
database transactions and model fixtures (available for all spec types, but more relevant here)


# Rails Matchers Cheat Sheet

Some of these are available to any spec once you've required `rails_helper`; others are just for certain spec types

see them

When you're doing outside-in acceptance testing:

- for HTTP-based APIs, use request specs
- for user-facing web applications, add Capybara to the project and use feature specs; see Michael Crismali's article for setup advice

!!!

https://www.devmynd.com/blog/setting-up-rspec-and-capybara-in-rails-5-for-testing/




















































































