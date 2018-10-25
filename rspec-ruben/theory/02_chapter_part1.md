Chapter 02: From writing specs to running them

# customizing your specs' output

## the progress formatter

new file
spec/coffe_spec.rb

```ruby
RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffe.new }

  it 'costs $1' do
    expect(coffee.price).to eq(1.00)
  end

  context 'with_milk' do
    before { coffee.add :milk }

    it 'costs $1.25' do
      expect(coffee.price).to eq(1.25)
    end
  end
end
```

the context block. this method groups a set of examples and their setup together with a common description.

context is just an alias for describe

```ruby
class Coffee
  def ingredients
    @ingredients ||= []
  end
end
```

if you have ingredients, return the ingredients, if not, return an empty array


page 35

```ruby
class Coffee
  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    1.00
  end
end
```

by choosing a different formatter, we can tailor the outpout

## The documentation Formatter

to see the output in documentation format, pass

```ruby
rspec --format documentation
```

or

```ruby
rspec -f d
```
this way, RSpec uses spacing and capitalization

## Syntax Highlighting

improve highlighting

install gem coderay !!! todo

```ruby
gem install coderay -v 1.1.1
```

colors like in your editor

RSpec will use CodeRay if it's available


# Identifying slow examples

find bottlenecks


```ruby
RSpec.describe 'The sleep() method' do
  it('can sleep for 0.1 second') { sleep 0.1 }
  it('can sleep for 0.2 second') { sleep 0.2 }
  it('can sleep for 0.3 second') { sleep 0.3 }
  it('can sleep for 0.4 second') { sleep 0.4 }
  it('can sleep for 0.5 second') { sleep 0.5 }
end
```

Use --profile to see to the top time-wasters and select how many (number of offenders)

```ruby
rspec --profile 2
```

```ruby
The sleep() method
  can sleep for 0.1 second
  can sleep for 0.2 second
  can sleep for 0.3 second
  can sleep for 0.4 second
  can sleep for 0.5 second

Top 2 slowest examples (0.90708 seconds, 59.5% of total time):
  The sleep() method can sleep for 0.5 second
    0.50159 seconds ./slow_spec.rb:6
  The sleep() method can sleep for 0.4 second
    0.40549 seconds ./slow_spec.rb:5

Finished in 1.52 seconds (files took 0.12879 seconds to load)
5 examples, 0 failures
```


# Running just what you need

pass a list of files or directories names

```ruby
rspec spec/unit
rspec spec/unit/specific_spec.rb
rspec spec/unit spec/smoke
rspec spec/unit spec/foo_spec.rb
```
## Running examples by name

```ruby
rspec -e milk -fd
```

fd: run options: include { :full_description=>/milk/ }

RSpec ran just the examples containing the word milk
RSpec searches the full description of each example

case sensitive

## Running specific failures

runjust the most recent failing spec

pass a filneame and line number separated by a colon

Rspec will run the example that starts on that line

first rspec, to see where we have problems, and then

```ruby
rspec ./spec/coffee_spec.rb:25
```

!!! dive in. time consuming changing to the terminal!

RSpec + IDEs and editor plugins

ThoughtBot’s rspec.vim plugin2
The RSpec package for Sublime Text4


## Rerunning everything that failed

if we have more than one failure, you can ram them all with

```ruby
rspec --only-failures
```

console says:

```ruby
To use `--only-failures`, you must first set `config.example_status_persistence_file_path`.
```

rspec needs a place to store the failures

you need to supply a filename through the RSpec.configure method.

between Coffee class and the specs

```ruby
RSpec.configure do |config|
  config.example_status_persistence_file_path = 'spec/examples.txt'
end
```

run first rspec, and then

```ruby
rspec spec/coffee_spec.rb --only-failures
```

this passes the test:

```ruby
class Coffee
  [...]

  def price
    return 1.00 + ingredients.size * 0.25
  end
end
```

## Focusing Specific Examples

if you run the same subset of specs repeatedly, you can mark them as focused.

> Add an f to the beginning of the RSpec method name

- context becomes fcontext
- it becomes fit
- describe becomes fdescribe

lets add the f in fcontext with milk

```ruby
  fcontext 'with_milk' do
```

now configure RSpec to run just the focused examples.

```ruby
RSpec.configure do |config|
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.filter_run_when_matching(focus: true)
end
```

now, when rspec, only run the example in the focused context

## Tag Filtering

This

```ruby
  fcontext 'with_milk' do
```

is the equivalent of

```ruby
  context 'with_milk', focus: true do
```

so any time we use describe, context or it, we can pass a hash with options

this hash is known as metadata, can contain keys and values

the `--only-failures`

is the same as (not recommended)

```ruby
rspec --tag last_run_status:failed
```

you also can pass (not recommended) `--tag focus` to run just focused specs, but instead we configured RSpec to do so by default


# Marking Work in Progress

you can sketch some examples, and RSpec uses pending examples

## Starting with the description

you can add empty examples

```ruby
it 'is light in color'
it 'is cooler than 200 degrees Fahrenheit'
```

if you run rspec, they are pending

## Marking incomplete work

sometimes you want to write the body of the spec, but just an idea.
you can mark this spec as pending.
the location matters: any lines before the pending call will still be expected to pass.

```ruby
it 'is light in color' do
  pending 'Color not implemented yet'
  expect(coffee.color).to be(:light)
end

it 'is cooler than 200 degrees Fahrenheit' do
  pending 'Temperature not implemented yet'
  expect(coffee.temperature).to be < 200.0
end
```

you see them, the errors, but they are marked as pending, and with a `*`, not with a F

## Completing work in progress

One of the nice things about marking examples as pending is that RSpec will let you know when they start passing


```ruby
RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'costs $1' do
    expect(coffee.price).to eq(1.00)
  end

  context 'with_milk' do
    before { coffee.add :milk }

    it 'costs $1.25' do
      expect(coffee.price).to eq(1.25)
    end

    it 'is light in color' do
      pending 'Color not implemented yet'
      expect(coffee.color).to be(:light)
    end

    it 'is cooler than 200 degrees Fahrenheit' do
      pending 'Temperature not implemented yet'
      expect(coffee.temperature).to be < 200.0
    end


  end
end
```


if you solve them in your class

```ruby
class Coffee
  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    return 1.00 + ingredients.size * 0.25
  end

  def color
    return ingredients.include?(:milk) ? :light : :dark
  end

  def temperature
    return ingredients.include?(:milk) ? 190.0 : 206.0
  end
end
```

they are marked as a failure, cuz they are pending

```ruby
A cup of coffee
  costs $1
  with_milk
    costs $1.25
    is light in color (FAILED - 1)
    is cooler than 200 degrees Fahrenheit (FAILED - 2)

Failures:

  1) A cup of coffee with_milk is light in color FIXED
     Expected pending 'Color not implemented yet' to fail. No error was raised.
     # ./spec/coffee_spec.rb:41

  2) A cup of coffee with_milk is cooler than 200 degrees Fahrenheit FIXED
     Expected pending 'Temperature not implemented yet' to fail. No error was raised.
     # ./spec/coffee_spec.rb:46

Finished in 0.00446 seconds (files took 0.12541 seconds to load)
4 examples, 2 failures
```

without the pendings, all good

>if you don't want to run the body of the spec at all, you can use skip instead pending. or you can use xit, which is a temporary annotation like fit, except that it skips the example instad of focusing it



















































































































