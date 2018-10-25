Rspec is made of 3 indepenent ruby gems
- rspec-core is the overall test harness that runs your specs.
- rspec-expectations provides a readable, powerful syntax for checking properties of your code.
- rspec-mocks makes it easy to isolate the code you’re testing from the rest of the system.

```ruby
gem install rspec -v 3.6.0
```

```ruby
rspec --version
```

Ex: sandwich

folder sandwich
sandwich/spec/sandwich_spec.rb

```ruby
l
```

```ruby
RSpec.describe 'An ideal sandwich' do
  it 'is delicious' do
    sandwich = Sandwich.new('delicious', [])
    taste = sandwich.taste
    expect(taste).to eq('delicious')
  end
end
```

describe creates an example group
defines what you are testing, in this case, a sandwich

it 'it's delicious' is an exmaple of sandwich's use


```ruby
rspec
```

look for something_spec.rb and run them

```ruby
An ideal sandwich
  is delicious (FAILED - 1)

Failures:

  1) An ideal sandwich is delicious
     Failure/Error: sandwich = Sandwich.new('delicious', [])

     NameError:
       uninitialized constant Sandwich
     # ./sandwich_spec.rb:5:in `block (2 levels) in <top (required)>'

Finished in 0.00168 seconds (files took 0.12383 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./sandwich_spec.rb:4 # An ideal sandwich is delicious
```


to make the test pass, following line on the top

```ruby
Sandwich = Struct.new(:taste, :toppings)
```

now the test pass. you can also use classes

# Difference between Struct and class

```ruby
class Sandwich
  attr_reader :taste

  def initialize(taste, ingredients)
    @taste = taste
    @ingredients = ingredients
  end

  # def taste
  #   return @taste
  # end
end

sandwhich = Sandwich.new("delicious", ["pepper", "tomatoe"])
p sandwhich
p sandwhich.taste
```

```ruby
#<Sandwich:0x00007fdc22154a68 @taste="delicious", @ingredients=["pepper", "tomatoe"]>
"delicious"
```

with struct

```ruby
Sandwich = Struct.new(:taste, :toppings)

sandwich = Sandwich.new("delicious", ["pepper", "tomatoe"])
p sandwich
p sandwich.taste
```

```ruby
#<struct Sandwich taste="delicious", toppings=["pepper", "tomatoe"]>
"delicious"
```

??? why struct has no 0x00007fdc22 pointer in memory?

# Sharing setup (but not sandwiches)

lets add a second example

```ruby
RSpec.describe 'An ideal sandwich' do
  it 'is delicious' do
    sandwich = Sandwich.new('delicious', [])
    taste = sandwich.taste
    expect(taste).to eq('delicious')
  end

  it 'lets me add toppings' do
    sandwich = Sandwich.new('delicious', [])
    sandwich.toppings << 'cheese'
    toppings = sandwich.toppings

    expect(toppings).not_to be_empty
  end
end
```

# not_to

```ruby
expect(toppings).not_to be_empty
```
be_empty is a construct


# write attribute toppings=

```ruby
class Sandwich
  attr_reader :taste
  # attr_writer :toppings

  def initialize(taste, toppings)
    @taste = taste
    @toppings = toppings
  end

  # def taste
  #   return @taste
  # end

  def toppings=(toppings)
    @toppings = toppings
  end

end

sandwhich = Sandwich.new("delicious", ["pepper", "tomatoe"])
p sandwhich
p sandwhich.taste
sandwhich.toppings = ["hola"]
```


the spec works fine, but it's repetitive
lets make a common sandwich to all our tests

there are 3 ways

- RSpec hooks run automatically at specific times during testing
- Helper methods are regular ruby methods: you control when these run
- RSpec's let construct initializes data on demand

# Hooks

before hook: runs automatically before each example

```ruby
RSpec.describe 'An ideal sandwich' do
  before { @sandwich = Sandwich.new('delicious', []) }
```

> the setup code is shared accross specs, but the individual Sandwich instance is not. Every example gets its own sandwich

you can add toppings, and this won't affect other examples


```ruby
Sandwich = Struct.new(:taste, :toppings)

RSpec.describe 'An ideal sandwich' do
  before { @sandwich = Sandwich.new('delicious', []) }

  it 'is delicious' do
    taste = @sandwich.taste
    expect(taste).to eq('delicious')
  end

  it 'lets me add toppings' do
    @sandwich.toppings << 'cheese'
    toppings = @sandwich.toppings

    expect(toppings).not_to be_empty
  end
end
```

hooks have downsides, you set up an instnace variable (time cost) to all the examples, and maybe you don't use it

let's undo the hook, to the initial situation

let's use a more traditional ruby way


# helper methods

each example group is a Ruby class, we can define methods on it

right after describe line

```ruby
def sandwich
  Sandwich.new('delicious', [])
end
```

but error

```ruby
An ideal sandwich
  is delicious
  lets me add toppings (FAILED - 1)

Failures:

  1) An ideal sandwich lets me add toppings
     Failure/Error: expect(toppings).not_to be_empty
       expected `[].empty?` to return false, got true
     # ./spec/sandwich_spec.rb:23:in `block (2 levels) in <top (required)>'

Finished in 0.02557 seconds (files took 0.12655 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/sandwich_spec.rb:18 # An ideal sandwich lets me add toppings
```

in our toppings example we call sandwitch twice
each call creates a new instance

```ruby
  it 'lets me add toppings' do
    # sandwich = Sandwich.new('delicious', [])
[1]    sandwich.toppings << 'cheese'
[2]    toppings = sandwich.toppings

    expect(toppings).not_to be_empty
  end
```

line 1 we create a new sandwich, we add a topping
line 2 we create a new sandwich, we read the toppings, which are empty


the solution is memoization, where we store the results of an operation (creating a sandwich) and refer to the stored copy from then on.

solution memoization !!! dive into it

```ruby
def sandwich
  @sandwich ||= Sandwich.new('delicious', [])
end
```

specs are working

The `||=` operator works by seeing if @sandwich is “falsey”—that is, false or nil—before creating a new sandwich. That means it won’t work if we’re actually trying to store something falsey.

```ruby
def current_toaster
  @current_toaster ||= Toaster.find_by_serial('HHGG42')
end
```
if search comes p empty, we store nil in the @current_toaster vairable. on next call to theper method, we do following

```ruby
@current_toaster = nil || Toaster.find_by_serial('HHGG42')
```

we call the potentially slow find_by_serial() method every time

the memoization does, if i have the thing, don't do anything, otherwise, create the instnace or do whatever you need to do.

if you store nil in the instance, you will be always using the search method


# Sharing Objects with let

let solves this problem


let is a construct, that handles this edge case

```ruby
let(:sandwich) { Sandwich.new('delicious', []) }
```

let is like binding a name (sandwich) to the result of a computation (the block). just as with a memoized helper method, RSpec will run the block the first time any example calls sandwich.

specs pass


```ruby
rspec --help
```































