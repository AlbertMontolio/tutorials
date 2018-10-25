01_dr_testing_in_rails.md
testing in rails

a collection of classes taht do not affect or alter your exising application

awaerness of broken parts of your application

getting the desired functionality

why write tests

refactoring code more confidently
add new code more confidentlyc
can help architect the business logic needed
reduce client frustration

rails 5.10 tests

included by default

model
controller
helper
integration
system

integration specs, feature test, sign in, adding to a shoping card

system specs, happy path, test what the user would see

# model specs

validations
associations
scopes
business logic

# Controller specs
status code?
content type?
layout/template rendered?
flash messages?
inserts/updates/deletes?
redirects?

# helper specs
specific to view helpers
testing methods
desired output?

# integration tests
feature testing (search, add to cart, etc.)
test interface between controllers

# system tests
browser testing
happy path. features must work!

they are slower

# other tests
jobs
services
mail
decorators
more

FRAMEWORKS

- minitest: default test in rails
- RSPEC
- cucumber: written in plain english
- capybara: under system test, in rails 5. more for browser test
- factorygirl: instead of fixtures, which are sample data. populate test db. factory girl alternative to use fixtures
- more

# a guide to testing rails applications

available assertion

start rails app

```ruby
rails new sample-100
```

```rb
rails g scaffold User first_name last_name email
```

# CONTROLLERS TEST

users_controller

```ruby
class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
```

before each test, will look up for users(:one) of the fixtures

in fixtures/users.yml

```ruby
one:
  first_name: MyString
  last_name: MyString
  email: MyString

two:
  first_name: MyString
  last_name: MyString
  email: MyString
```

```ruby
class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end
  ```

get is gonna make a browser call to the users_url

it asserts the response to success

creating the user

```ruby
  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name } }
    end

    assert_redirected_to user_url(User.last)
  end
```

we check if the user count is the same

assert_redirected

in the controller we need to have the redirect!

we are not testing the business logic

we test if response is success and response


# MODELS TEST

```ruby
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email validation should trigger" do
    assert_not User.new(first_name: 'First Name', last_name: 'Last Name').save
  end

  test "user should save" do
    assert User.new(first_name: 'First Name', last_name: 'Last Name', email: 'name@example.org').save
  end
end

```

run our test

```ruby
rails test
```

```ruby
Failure:
UserTest#test_email_validation_should_trigger [/Users/albert/localDocuments/CodingArea/tutorials/capybara/exercises/samplee-100/test/models/user_test.rb:7]:
Expected true to be nil or false
```

in user.rb

```ruby
validates :email, presence: true
```

# SYSTEM TESTS

```ruby
require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Email", with: @user.email
    fill_in "First Name", with: @user.first_name
    fill_in "Last Name", with: @user.last_name
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Email", with: @user.email
    fill_in "First Name", with: @user.first_name
    fill_in "Last Name", with: @user.last_name
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
```


inheriting from ApplicationSystemTestCase

```ruby
require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
```

test visiting index
visit uesers url
assert_selector "h1"

we can fill_in forms

we can visit users_url and see if user is there

```ruby
rails test:system
```

they are not run by defualt with rails test


































































