
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





























































































