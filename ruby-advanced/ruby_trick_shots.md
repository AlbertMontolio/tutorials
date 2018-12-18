
code might look to clover

# random number from a range


```ruby
rand(10)

#in a range
high = 20
low = 10
rand(high - low) + low
```

in ruby new

```ruby
rand(10..20)
rand(10...20)

older versions
Random.new.rand(10..20)
```

# awesome_print

```ruby
p [1,2,3]
pp?

require 'ap'
ap [1,2,3]
```

```ruby
gem install awesome_print
```

# curious concatenation

```ruby

"abc" + "def"
"abc".concat("def")

# other way
x = "abc" "def"
```

# simple presence of a substring

check if a string contains a substring

you could use a regexp

```ruby
x = "this is a test"
x =tilde //

```

just do that, if the string does not exist, it returns nil

```ruby
x["test"] => "test"
x["yyy"] => nil
```

create strings

```ruby
x = %{fadfafa}
or
x = %|fadfafa|
x = %|fadfafa|

```

multiple module inclusion

```ruby
module Foo
  def bar
    puts "Hello world!"
  end
end

module Foo2
  def bar
    puts "Goodbye world!"
  end
end

class MyClass
  include Foo
  include Foo2
end

MyClass.new.bar
```

you can include in the same line

```ruby
module A
  def self.included(base); puts self.name; end
end

module B
  def self.included(base); puts self.name; end
end

module C
  def self.included(base); puts self.name; end
end

class D
  include A, B, C
end
```

included method, you see when they are included

the order is c,b,a

# instance variable interpolation shorthand


```ruby
@mystr = "this is a test"
mystr = "this is a test as well"

"fadafadafa #{mystr}"
"fadafadafa #{2 + 2}"
```

if you have an instance variable, that has an @

you don't need the curly braces

```ruby
"fadfafa #@mystr asfafa"
```

# ruby syntax checking at the command line

ruby -c awesome.rb

it's all about the syntax

# ruby syntax analysis with ripper

```ruby
require 'ripper'
require 'ap'

ap Ripper.sexp("puts {}.class")
```

# chained ifs

not useful

```ruby
puts "yay" if 2 == 2 if 1 == 1

```


# next as a return for procs and blocks

```ruby
10.upto(20) do |i|
  next if i.even?
  puts i
end
```

in map

```ruby
a = [1,2,3,4].map do |bar|
  bar * 2
end

p a
```
the code block, behinde the scenes, is treated as a
prop block

from a lambda, you can use the return, like in a method

in a prop block, thinks are sligthly different

if we use return in a prop

```ruby
a = [1,2,3,4].map do |bar|
  return 10
  bar * 2
end

p a
```

unexpected return

in procs, the scope of return, is the outter one, where the proc sits, not the proc istelf

since we are in the main scope, you can not return there

what if i want to return a different value

```ruby
a = [1,2,3,4].map do |bar|
  return 10 if rand(5) == 0
  bar * 2
end

p a
```

in scope of prop blocks
this will return 10 to map



# closure in lambdas

```ruby
def multiple_generator(m)
  puts "entering the method"
  puts "m: #{m}"
  puts "storing a_lambda in memory..."
  a_lambda = lambda do |n|
    puts "inside the lambda"
    puts "n: #{n}"
    puts "m: #{m} that's a surprise"
    n * m
  end
  puts "method is finished"
  return a_lambda
end

doubler = multiple_generator(2)
puts "abandoning the method"
puts "doubler contains a_lambda"
p doubler
# tripler = multiple_generator(3)

puts "calling the lambda passing n argument (5)"
puts doubler[5] #=> 10
# puts tripler[10] #=> 30
```

# zipping arrays together

```ruby
names = %w{fred jess john}
ages = [38,47,91]

p names.zip(ages)
p Hash[names.zip(ages)]
```

```ruby
[["fred", 38], ["jess", 47], ["john", 91]]
{"fred"=>38, "jess"=>47, "john"=>91}
```


you can even zip more

```ruby
locations = %{spain france usa}

p names.zip(ages, locations)

names.zip(ages, locations) do |foo|
  p foo
end
```

it gets a block, its like an each

# exploding ranges into arrays

```ruby
[*10..20]
=> [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
c = 10
[*c]
c = [1,2,3,4]
Array(c)
Array(10..20)
```

# json output

```ruby
require "json"
h is an array of hashes
p h
j h => wow! used in js
j h => wow! used in js
```

# __method__
get the name of the method you are currently in

```ruby
def my_method
  p __method__
  p __callee__
end

my_method
```

```ruby
class X
  def self.make_stuff(*meths)
    meths.each do |meth|
      define_method(meth) do
        __method__
      end
    end
  end

  make_stuff :a, :b, :c
end

x = X.new
p x.a
p x.b
p x.c
```

# multiline method chaining

```ruby
puts "this is a test".scan(/\w+)
                     .map(&:upcase)
                     .map(&:reverse)
                     .to_s)

```

# _ in irb

```ruby
_ last value

```

# checking set bits in numbers

represent binary num

```ruby
0b0101010
c = 0b010101010
#=> 170
c[0]

from the right
c & 1 << 0
c & 1 << 1
```


# parameters defaulting to other parameters

```ruby
def my_method(a, b = a)
  puts "#{a} #{b}"
end

my_method(1) # a= 1, b= 1
my_method(2) # a= 1, b= 2

```

if second argument does not come throgh its a

# Proc#source_location

```ruby
a = ->{ }
b = ->{ }

p a.source_location
p b.source_location
```


this also works in method

```ruby
require 'app'
p method(:ap).source_location
```

```ruby
require 'active_support/core_ext/string/inflections'
p "WonderBar".method(:tableize).source_location
```


# prepending to a string in a place

```ruby
a = "world"
"hello " + a

a.insert(0, "hello ")

a.prepend("Hello ")
```

storing data in the source File

```ruby
puts "Hello world!"

__END__

puts "Do we ever get here?"

```

tells ruby don't go beyond this point

```ruby
puts "Hello world!"

puts DATA.read

__END__

puts "Do we ever get here?"

```

after the end we place data


```ruby
puts "Hello world!"

DATA.rewind
puts DATA.read

__END__

puts "Do we ever get here?"
```

we read the whole file


# a few simple regular expression matching tricks

```ruby
str = "Fred Flintstone: Superhero"
str[/\w+/]
str[/(\w+) (\w+)/]
str[/(\w+) (\w+)/, 1]
str[/(\w+) (\w+)/, 2]
str[/(?<a>\w+) (?<b>\w+)/, :a]
str[/(?<a>\w+) (?<b>\w+)/, :b]


str[/(?<a>\w+) (?<b>\w+)/]
$tilde[:a]

/(?<a>\w+) (?<b>\w+)/ =tilde str
a
b
```





























































































