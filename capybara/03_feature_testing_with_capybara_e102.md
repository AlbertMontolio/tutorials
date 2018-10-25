# episode 102, feature testing with capybara


clicking through actions

browser testing, its slower

acceptance test

happy path testing

what the user clicks
client pays for features, they must work!

rails 5.1 sistem test, that is capybara

docu is awesome for the syntax

users controller, new, create update destroy have no coverage

system test or capybara to test this actions

add gem capybara

gem

```ruby
group :test do
  gem 'sipmlecov', require: false
  gem 'capybara'
end
```

rails_helper.rb

```ruby
require "capybara/rails"
```

```ruby
rails g rspec:feature users
```



```ruby
require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
  end

  context 'update user' do
  end

  context 'destroy user' do
  end
end
```


capybara they have a feature, like the it

```ruby
require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    scenario "should be successful" do
    end
    scenario "should fail" do
    end
  end

  context 'update user' do
  end

  context 'destroy user' do
  end
end
```

user has 3 attributes

```ruby
require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    scenario "should be successful" do
      visit new_user_path
      within('form') do
        fill_in 'First name', with: 'john'
        fill_in 'Last name', with: 'doe'
        fill_in 'Email', with: 'john.doe@example.com'
      end
      click_button 'Create User'
      expect(page).to have_content('user was successfully created.')
    end
    scenario "should fail" do
    end
  end

  context 'update user' do
  end

  context 'destroy user' do
  end
end
```

we can pass an id or class to with

to make the test pass, you have to create the create action with notice flash, and in the show, show the notice "user was...", the show needs to have the user!


one test passes

```ruby
rspec spec/features/users_spec.rb
```

```ruby
rspec spec/features/users_spec.rb:5
```

```ruby
require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    scenario "should be successful" do
      visit new_user_path
      within('form') do
        fill_in 'First name', with: 'john'
        fill_in 'Last name', with: 'doe'
        fill_in 'Email', with: 'john.doe@example.com'
      end
      click_button 'Create User'
      expect(page).to have_content('user was successfully created.')
    end
    scenario "should fail" do
      visit new_user_path
      within('form') do
        fill_in 'First name', with: 'john'
        fill_in 'Last name', with: 'doe'
      end
      click_button 'Create User'
      expect(page).to have_content('user was successfully created.')
    end
  end

  context 'update user' do
  end

  context 'destroy user' do
  end
end
```

email can't be blank!

```ruby
scenario "should fail" do
  visit new_user_path
  within('form') do
    fill_in 'First name', with: 'john'
    fill_in 'Last name', with: 'doe'
  end
  click_button 'Create User'
  expect(page).to have_content('Email can\'t be blank')
end
```

don't forget to put the errors in the form, when render :new cuz it was not saved


```ruby
context 'create new user' do
  scenario "should be successful" do
    visit new_user_path
    within('form') do
      fill_in 'First name', with: 'john'
      fill_in 'Last name', with: 'doe'
      fill_in 'Email', with: 'john.doe@example.com'
    end
    click_button 'Create User'
    expect(page).to have_content('User was successfully created.')
  end
  scenario "should fail" do
    visit new_user_path
    within('form') do
      fill_in 'First name', with: 'john'
      fill_in 'Last name', with: 'doe'
    end
    click_button 'Create User'
    expect(page).to have_content(/Email can\'t be blank/)
  end
end
```

```ruby
context 'create new user' do
  before(:each) do
    visit new_user_path
    within('form') do
      fill_in 'First name', with: 'john'
      fill_in 'Last name', with: 'doe'
    end
  end
  scenario "should be successful" do
    within('form') do
      fill_in 'Email', with: 'john.doe@example.com'
    end
    click_button 'Create User'
    expect(page).to have_content('User was successfully created.')
  end
  scenario "should fail" do
    click_button 'Create User'
    expect(page).to have_content(/Email can\'t be blank/)
  end
end
```


for update we need a user created first

```ruby
context 'update user' do
  scenario "should be successful" do
    user = User.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com')
    visit edit_user_path(user)
    within('form') do
      fill_in 'First name', with: 'Jane'
      fill_in 'Email', with: 'jane.doe@example.com'
    end
    click_button 'Update User'
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'jane.doe@example.com'
  end

  scenario "should fail" do
    user = User.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com')
    visit edit_user_path(user)
    within('form') do
      fill_in 'First name', with: ''
    end
    click_button 'Update User'
      expect(page).to have_content(/First name can\'t be blank/)
  end
end
```

refactor test

```ruby
context 'update user' do

  let!(:user) { User.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com') }

  before(:each) do
    visit edit_user_path(user)
  end

  scenario "should be successful" do
    within('form') do
      fill_in 'First name', with: 'Jane'
      fill_in 'Email', with: 'jane.doe@example.com'
    end
    click_button 'Update User'
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'jane.doe@example.com'
  end

  scenario "should fail" do
    within('form') do
      fill_in 'First name', with: ''
    end
    click_button 'Update User'
      expect(page).to have_content(/First name can\'t be blank/)
  end
end
```

destroy user

```ruby
context 'destroy user' do
  scenario "should be successful" do
    user = User.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com')
    visit users_path
    click_link 'Destroy'
    expect(page).to have_content 'User was successfully destroyed'
  end
end
```


count users after destroy

```ruby
context 'destroy user' do
  scenario "should be successful" do
    user = User.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com')
    visit users_path
    # click_link 'Destroy'
    expect { click_link 'Destroy' }.to change(User, :count).by(-1)
    expect(page).to have_content 'User was successfully destroyed'
  end
end
```

we are not testing the js!
capybara can'T
you need sth like selenium

also use the chrome driver or gecko driver

in gemfile

```ruby
group :test do
  gem 'simplecov', require: false
  gem 'capybara'
  gem 'selenium-webdriver'
end
```

bundle

in your terminal

```ruby
brew install geckdriver
brew services start geckdriver

Capybara.default_driver = :selenium
```

if u want to use chrome driver

```ruby
brew install chromedriver
brew services start chromedriver

Capybara.default_driver = :selenium_chrome
```

new version of chrome, headless version

```ruby
Capybara.default_driver = :selenium_chrome_headless
```

rspec

now, destroy does not work

wbekit never executed the js

```ruby
<%= link_to "Destroy", user_path(user), method: :delete, data: { confirm: "Are you sure?" } %>
```

the action is not called, the js dialog is pop uped

we need to modify our destroy test

```ruby
accept_confirm do
  click_link 'Destroy'
end
```

devise how to test with capybara




























