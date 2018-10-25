automated test

clicking through the actions

acceptance pass or fail

it's much slower than controller or model test

happy path testing

critical features, customer is paying


simplecov to see our coverage!

add gem capybara in :test

within rails helper, require "capybara/rails"

```ruby
rails g rspec:feature users
```

capybara has feature, it's like the it in RSpec

a user has 3 attributes, with validations

within is a helper method, we are gonna look for within sth to do sth else

```ruby
we can use visit with helper path
```

```ruby
RSpec.feature "Users", type: :feature do
  context 'create new user' do
    scenario "should be successful" do
      visit new_user_path
      within('form') do
        fill_in 'First name', with: 'john'
        fill_in 'Last name', with: 'doe'
        fill_in 'Email', with: 'john@doe.mail.com'
      end
      click_button 'Create user'
      expect(page).to have_content('user was successfully created')
    end
  end
end
```

looking for the form element tag, you can pass an id, class etc

fill_in, you can also pass an id

we have the forms fill in

click button is case sensitive

expect sth

```ruby
user = User.create(first_name: "john")
visit edit_user_path(user)
```

```ruby
# click_link 'Destroy'
expect { click_link 'Destroy' }.to change(User, :count).by(-1)
expect(page).to have_content 'User was successfully destroyed'
```

# Javascript in capybara

selenium-webdriver in group :test

in a mac

brew install geckodriver
brew services start geckodriver

Capybara.default_driver = :selenium

if you want to use chromedriver

brew install chromedriver
brew services start chromedriver

Capybara.default_driver = :selenium_chrome

in new versions of chrome

Capybara.default_driver = :selenium_chrome_headless

now js fails, cuz the data: {confirm: 'Are you sure?'}

when we click destroy, we don't do the action immediately, a popup appears

what we need to do is

```ruby
context 'destroy user' do
  scenario "should be successful" do
    user = User.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com')
    visit users_path
    accept_confirm do
      expect { click_link 'Destroy' }.to change(User, :count).by(-1)
    end
    expect(page).to have_content "User was successfully destroyed"
  end

end



```

https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara



























