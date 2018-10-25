# speeding up tests

```ruby
gem parallel_tests
```

based on the num of threads that u have in your cpu,

gem file

developmet, test group

```ruby
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'pry'
  gem 'parallel_tests'
end
```

in database.yml (config)

```ruby
test:
  <<: *default
  database: db/test.sqlite3
```



```ruby
test:
  <<: *default
  database: db/test<%= ENV['TEST_ENV_NUMBER'] %>.sqlite3
```

```ruby
rails parallel:create
```

rseults:

```ruby
Database 'db/test.sqlite3' already exists
Created database 'db/test2.sqlite3'
Created database 'db/test4.sqlite3'
Created database 'db/test3.sqlite3'
```

when migration changes, then

```ruby
rails parallel:migrate
```

it migrates for the 4 db!

rspec

with just one threat

```ruby
Finished in 0.64304 seconds (files took 2.52 seconds to load)+
```

```ruby
rails parallel:spec
```

rsults

```ruby
4 processes for 4 specs, ~ 1 specs per process

...


Finished in 0.81835 seconds (files took 3.75 seconds to load)
5 examples, 0 failures
```

it took longer, it load different environments. it load 4 environments (the 4 db)

```ruby
gem database_cleaner
```

useful to do a transaction clean up

after each of our ocntroller and model test

support folder
databaser_cleaner.rb ?r

```ruby
RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
```

1 clean db with truncation
whipe up all the tables, execpt migration

if you want to change strategy for feature test, you can do:

```ruby
config.before(:each, type: :feature) do
  DatabaseCleaner.strategy = :truncation
end
```






























