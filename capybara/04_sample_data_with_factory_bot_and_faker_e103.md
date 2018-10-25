# factory bot

a replacement for fixtures

rails factory_bot_rails

adds different helpers for generators

```ruby
group :test do
  gem 'simplecov', require: false
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'factory_bot_rails'
  gem 'faker'
end
```

under spec directory
folder support

factory_bot.rb

initializer for the factory bot

```ruby
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
```

in rails helper

```ruby
require "support/factory_bot"
```

if you want to require many support files, you can do:

```ruby
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
```

under spec folder, factories
user.rb

```ruby
FactoryBot.define do

end
```

we can start creating a factory

a factory will be called within our test and will allow us to create a sample user

whenever we call or create a user, it will reference this one from the factory bot

```ruby
FactoryBot.define do
  factory :user do
    first_name 'John'
    last_name 'Doe'
    email 'john.doe@example.com'
    active true
  end
end
```

everything is static

maybe we want random data

we need to tell from which class the instance is coming from

```ruby
FactoryBot.define do
  factory :user do
    first_name 'John'
    last_name 'Doe'
    email 'john.doe@example.com'
    active true
  end

  factory :random_user, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.safe_email }
    active true
  end
end
```

in the model spec, we were creating a new user for every test

```ruby
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
```



inside the context, that means, for all the examples (tests), we can do:

```ruby
let(:user) { build(:user) }
```

we call build here, cuz we want to manipulate the user, so that we can check the test and the validations

build is the same as User.new()
and passing some attributes

```ruby
let(:user) { build(:user) } # User.new({})
# let(:user) { create(:user) } # User.create({})
```

```ruby
RSpec.describe User, type: :model do
  context 'validation test' do
    let(:user) { build(:user) }

    it 'ensures first name presence' do
      # user = User.new(last_name: 'Last', email: 'sample@example.com').save
      user.first_name = nil
      expect(user.save).to eq(false)
    end
    it 'ensures last name presence' do
      # user = User.new(first_name: 'Last', email: 'sample@example.com').save
      user.last_name = nil
      expect(user.save).to eq(false)
    end
    it 'ensures email presence' do
      # user = User.new(first_name: 'Last', last_name: 'sample@example.com').save
      user.email = nil
      expect(user.save).to eq(false)
    end
    it 'ensures save successfully' do
      # user = User.new(first_name: 'First', last_name: 'Last', email: 'sample@example.com').save
      expect(user.save).to eq(true)
    end
  end
```

if we use let (not let!), this build is not gonna be run until we see user in the exaple

if you want to create a user for every example, we need the let!


just run user_spec.rb

```ruby
rspec spec/models/user_spec.rb
```

we can use the random user

```ruby
RSpec.describe User, type: :model do
  context 'validation test' do
    let(:user) { build(:random_user) }
```

we can even overwrite attributes when we call the build

```ruby
RSpec.describe User, type: :model do
  context 'validation test' do
    let(:user) { build(:random_user, first_name: 'tacos') }
```

now, we want to make sure that our email address is unique

```ruby
validates :email, presence: true, uniqueness: true
```

specs fail, cuz test is using same email address

```ruby
scope tests
    should return active users (FAILED - 1)
    should return inactive users (FAILED - 2)
```

we still have the old method of creating users, and all have same email

```ruby
context 'scope tests' do
  let(:params){ { first_name: 'First', last_name: 'Last', email: 'sample@example.com' } }

  before(:each) do
    User.new(params).save
    User.new(params).save
    User.new(params.merge(active: true)).save
    User.new(params.merge(active: false)).save
    User.new(params.merge(active: false)).save
  end

  it 'should return active users' do
    expect(User.active_users.size).to eq(3)
  end

  it 'should return inactive users' do
    expect(User.inactive_users.size).to eq(2)
  end
end
```

we want to create 5 random usrs, but, 2 of them are inactive, 3 of them active

we could create 5 random users, or use:

```ruby
context 'scope tests' do
  # let(:params){ { first_name: 'First', last_name: 'Last', email: 'sample@example.com' } }

  # before(:each) do
  #   User.new(params).save
  #   User.new(params).save
  #   User.new(params.merge(active: true)).save
  #   User.new(params.merge(active: false)).save
  #   User.new(params.merge(active: false)).save
  # end

  let(:users) { create_list(:randome_user, 5) }

  it 'should return active users' do
    expect(User.active_users.size).to eq(3)
  end

  it 'should return inactive users' do
    expect(User.inactive_users.size).to eq(2)
  end
end
```

this will call the factory random user 5 times

lets add two with active: false

```ruby
before(:each) do
  users.last(2).map { |u| u.update(active: false) }
end
```

































