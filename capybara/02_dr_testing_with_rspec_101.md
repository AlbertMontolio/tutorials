02_dr_testing_with_rspec_101.md

rspec-rails

like minitest, syntax is better

```ruby
rails new template -T
```

add rspec-rails, developme test

```ruby
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
end
```

run bundle

```ruby
rails generate rspec:install
```

```ruby
Running via Spring preloader in process 19493
      create  .rspec
      create  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb
```

userb.rb shoud have
first_name string
last_name string
email string
active boolean, default true

spec_helper.rb

config.order = :random

all the tests run in random order


ralis_helper

specific to rails
use_transaction_fixtures

after every test, db changes will be rollback

always fresh test

let's test user model

```ruby
rails g rspec:model user
```

we see type model.
test validations, test scopes

```ruby
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do

  end

  context 'scope tests' do

  end
end
```

```ruby
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures first name presence' do
    end
    it 'ensures last name presence' do
    end
    it 'ensures email presence' do
    end
    it 'ensures save successfully' do
    end
  end

  context 'scope tests' do

  end
end
```

context & describe are aliases
context encapsulate a bunch of examples
like validation tests


it means, this is a test

user_spec.rb

```ruby
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures first name presence' do
      user = User.new(last_name: 'Last', email: 'sample@example.com').save
      expect(user).to eq(false)
    end
    it 'ensures last name presence' do
      user = User.new(first_name: 'Last', email: 'sample@example.com').save
      expect(user).to eq(false)
    end
    it 'ensures email presence' do
      user = User.new(first_name: 'Last', last_name: 'sample@example.com').save
      expect(user).to eq(false)
    end
    it 'ensures save successfully' do
      user = User.new(first_name: 'First', last_name: 'Last', email: 'sample@example.com').save
      expect(user).to eq(true)
    end
  end

  context 'scope tests' do

  end
end
```

3 failures
...

```ruby
.rspec
--format documentation
```

in user model

```ruby
validates :first_name, presence: true
validates :last_name, presence: true
validates :email, presence: true
```

in scope test. we want to know the active and inactive users

```ruby
context 'scope tests' do

end
```

we want to use the same sample data

```ruby
context 'scope tests' do
  before(:each) do
    User.new(first_name: 'First', last_name: 'Last', email: 'sample@example.com').save
    User.new(first_name: 'First', last_name: 'Last', email: 'sample@example.com').save
    User.new(first_name: 'First', last_name: 'Last', email: 'sample@example.com').save
    User.new(first_name: 'First', last_name: 'Last', email: 'sample@example.com', active: false).save
    User.new(first_name: 'First', last_name: 'Last', email: 'sample@example.com', active: false).save
  end
end
```

we have duplicated code
lets use let

```ruby
context 'scope tests' do

  let(:params){ { first_name: 'First', last_name: 'Last', email: 'sample@example.com' } }

  before(:each) do
    User.new(params).save
    User.new(params).save
    User.new(params).save
    User.new(params.merge({ active: false })).save
    User.new(params.merge({ active: false })).save
  end
end
```

```ruby
context 'scope tests' do

  let(:params){ { first_name: 'First', last_name: 'Last', email: 'sample@example.com' } }

  before(:each) do
    User.new(params).save
    User.new(params).save
    User.new(params).save
    User.new(params.merge( active: false )).save
    User.new(params.merge( active: false )).save
  end
end
```

just to make sure

```ruby
context 'scope tests' do

  let(:params){ { first_name: 'First', last_name: 'Last', email: 'sample@example.com' } }

  before(:each) do
    User.new(params).save
    User.new(params).save
    User.new(params.merge(active: true)).save
    User.new(params.merge( active: false )).save
    User.new(params.merge( active: false )).save
  end
end
```

let! is explicitely run before each test
let without !, just when the thing is called

in context scope tests

```ruby
it 'should return active users' do
  expect(User.active_users.size).to eq(3)
end

it 'should return inactive users' do
  expect(User.inactive_users.size).to eq(2)
end
```

user.rb

```ruby
  scope :active_users, -> { where(active: true) }
  scope :inactive_users, -> { where(active: false) }
```

# TESTS FOR CONTROLLERS

```ruby
rails g rspec:controller users
```

users_controller_spec.rb

```ruby
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET #index' do
    it 'returns a success response' do

    end
  end

  context 'GET #show' do
    it 'returns a success response' do

    end
  end
end
```


```ruby
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success
      # response.success?
    end
  end

  context 'GET #show' do
    it 'returns a success response' do
      user = User.create!(first_name: 'First', last_name: 'Last', email: 'first.last@example.com')
      get :show, params: { id: user.to_param }
      expect(response).to be_success
    end
  end
end
```

how much coverage do we have?

```ruby
rails stats
```

Code to test ratio

cautio:

SimpleCov

```ruby
gem 'simplecov', require: false, :group => :test
```


bundle

spec helper file

spec_helper.rb

```ruby
require 'simplecov'
SimpleCov.start
```

rspec rails docu on relish

a lot of examples

request specs similiar to integration test





























































