# Test Driven RSpec - Episode 05, Capybara Basics

This episode covers interacting with web pages in tests using Capybara

This episode covers:

- configuring Capybara with Rspec
- Visiting pages
- Expecting content to be present
- Clicking links
- Testing the current URL

Install the dependencies 'bundle install' and run the specs with 'bin/rspec'

Software used

- Ruby
- Rails
- Rspec
- Capybara
- Mac OS
- iTerm 2
- Vim
- Tmux

Capybara is included in rails

rspec-rails also, selenium-webdriver also


rspec in rails,

group :development, :test do
  gem 'rspec-rails', '~> 3.8'
end

in rails_helper, you have to require Capybara

require 'capybara/rspec'

this allows capybara dsl to be used within the rspec tests

we put in rails_helper, cuz we test the whole app, not just a class or whatever


we could have a spec/requests directory, where we have the requests to the api

now we have a features directory

features test, high level acceptance test

rspec knows that tests inside features directory are features tests

test to test
expects some content in a web page

home_spec.rb

```ruby
require 'rails_helper'

Rspec.describe 'Home features' do
  it 'displays the name of the app' do
    visit('/')
    expect(page).to have_content('Hello world')
  end
end
```

have_content comes from capybara dsl

have_content waits til js is loaded

run the test

bin/rspec spec/features/home_spec.rb


```ruby
require 'rails_helper'

Rspec.describe 'Home features' do
  it 'displays the name of the app' do
    visit('/')
    expect(page).to have_content('Hello world')
    click_link('Add product')
    expect(current_path).to eql('/about')
    expect(page).to have_content('<h1>About</h1>')
  end
end
```














