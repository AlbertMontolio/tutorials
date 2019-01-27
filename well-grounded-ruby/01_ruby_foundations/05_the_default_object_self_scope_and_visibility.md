# 5 The default object (self), scope, and visibility

this chapter covers

- the role of the current or default object, self
- scoping rules for local, global, and class variables
- constant lookup and visibility
- method-access rules

self is the current or default object.
the rules of scope govern the visibility of variables

method access. Ruby provides mechanisms for making distinctions among access levels of methods. Basically, this means rules limitaing the calling of methods depending on what self is.

top-level methods: which are written outside of any class or module definition

# Self as the default receiver of messages

```ruby
obj.talk
ticket.venue
"abc".capitalize
```

if the receiver of the message is self, you can omit the receiver and the dot

```ruby
talk == self.talk
venue == self.venue
capitalize == self.capitalize
```

# resolving instance variables through self

```ruby
class C
  puts "Just inside class definition block. Here's self:"
  p self
  @v = "I am an instance variable at the top level of a class body."
  puts "And here's the instance variable @v, belonging to #{self}:"
  p @v
  def show_var
    puts "Inside an instance method definition block. Here's self:"
    p self
    puts "And here's the instance variable @v, belonging to #{self}:"
    p @v
  end 
end
c = C.new
c.show_var
```

output

```ruby
Just inside class definition block. Here's self:
C
And here's the instance variable @v, belonging to C:
"I am an instance variable at the top level of a class body."
Inside an instance method definition block. Here's self:
#<C:0x00000101a77338>
And here's the instance variable @v, belonging to #<C:0x00000101a77338>:
nil
```

@v inside the method is nil. Cuz the instance variable that we defined was to the class. When we do def initialize, the instance variables that we define inside, the self, is the object. When you call the instance method, is the same object, so it has the same instance variable

# Global scope and global variables
Global scope is scope that covers the entire program. Global scope is enjoyed by global variables, which are recognizable by their initial dolla-sign ($) char. They're available everywhere. They walk through walls!

```ruby
$gvar = "I'm a global!"
class C
  def examine_global
    puts $gvar
end end
c = C.new
c.examine_global
```

$0 contains the name of the startup file for the currently running program.
$: directories that make up the path ruby searches

# local scope

```ruby
class C 
 16   def x(value_for_a, recurse=false)
 15     a = value_for_a
 14     print "here's the inspect-string for 'self':"
 13     p self
 12     puts "And here's a:"
 11     puts a 
 10     if recurse
  9       puts "Calling myself (recursion)..."
  8       x("Second value for a")
  7       puts "Back after recursion; here's a:"
  6       puts a 
  5     end
  4   end
  3 end
  2 
  1 c = C.new
18  c.x("First value for a", true)
```

```ruby
here's the inspect-string for 'self':#<C:0x00007f7f7e819fe8>
And here's a:
First value for a
Calling myself (recursion)...
here's the inspect-string for 'self':#<C:0x00007f7f7e819fe8>
And here's a:
Second value for a
Back after recursion; here's a:
First value for a
```

value of a does not change, everytime we call a method, new scope

The constant X in one scope isn’t the constant X in another:

```ruby
modul M
  class C
    X = 2
    class D
      module N
        X = 1
      end
    end
  end
end
```

for getting for sure a ruby String class

```ruby
::String.new("hello")
```

# Class variable syntax, scope, and visibility

```ruby
@@var
```

class variables aren't class scoped. Rather, they are class-hierarchy scoped.

At its simplest, the idea behind a class variable is that it provides a storage mecha- nism that’s shared between a class and instances of that class, and that’s not visible to any other objects.

#Class variables and the class hierarchy

```ruby
class Parent
  @@value = 100
end
class Child < Parent
  @@value = 200
end
class Parent
  puts @@value
end
```

what gets printed is 200

example Car with class variables

```ruby
class Car
  @@makes = []
  @@cars = {}
  @@total_count = 0
  attr_reader :make
  def self.total_count
    @@total_count
  end
  
  def self.add_make(make)
    unless @@makes.include?(make)
      @@makes << make
      @@cars[make] = 0
    end
  end

  def initialize(make)
    if @@makes.include?(make)
      puts "Creating a new #{make}!"
      @make = make
      @@cars[make] += 1
      @@total_count += 1
    else raise "No such make: #{make}."
    end
  end
  
  def make_mates
    @@cars[self.make]
  end
end
```

Car with @@total_count replaced by instance variable @total_count

```ruby
class Car
  @@makes = []
  @@cars = {}
  attr_reader :make
  def self.total_count
    @total_count ||= 0
  end

  def self.total_count=(n)
    @total_count = n
  end
  
  def self.add_make(make)
    unless @@makes.include?(make)
      @@makes << make
      @@cars[make] = 0
    end
  end

  def initialize(make)
    if @@makes.include?(make)
      puts "Creating a new #{make}!"
      @make = make
      @@cars[make] += 1
      # @@total_count += 1
      self.class.total_count += 1 #<------
    else raise "No such make: #{make}."
    end
  end
  
  def make_mates
    @@cars[self.make]
  end
end
```

The payoff comes when we subclass Car. Let’s have another look at Hybrid and some sample code that uses it:

```ruby
class Hybrid < Car
end

h3 = Hybrid.new("Honda")
f2 = Hybrid.new("Ford")
puts "There are #{Hybrid.total_count} hybrids on the roda!"
```

Hybrid is a new class object. It isn't the same object as Car. Therefore, it has its own instance variables.

# Deploying method-access rules
As you've seen, the main business of a Ruby program is to send messages to objects. And the main business of an object is to respond to messages. Sometimes, an object wants to be able to send itself messages that it doesn't want anyone else to be able to send it. For this scenario, Ruby pvodides the ability to make a method private.

There are two access levels other than privaate: protected, which is a slight variation on private, and public. Public is the deefault access leve; if you don't speficy that a method is protected or pvivate, it's public. Public instance methods are the common currency of Ruby programming.

# Private methods

```ruby
class Cake
  1   def initialize(batter)
  2     @batter = batter
  3     @baked = true
  4   end
  5 end
  6 
  7 class Egg
  8 end
  9 
 10 class Flour
 11 end
 12 
 13 class Baker
 14   def bake_cake
 15     @batter = []
 16     pour_flour
 17     add_egg
 18     stir_batter
 19     return Cake.new(@batter)
 20   end
 21 
 22   def pour_flour
 23     @batter.push(Flour.new)
 24   end
 25 
 26   def add_egg
 27     @batter.push(Egg.new)
 28   end
 29 
 30   def stir_batter
 31   end
 32 
 33   private :pour_flour, :add_egg, :stir_batter
 34 end
```

the private methode takes a list of arguments that you want to make private

no arguments, works like a switch, until you say protected or public

you can't call a private method to an object

```ruby
b = Baker.new
b.add_egg
```

```ruby
`<main>': private method `add_egg' called for #<Baker:0x00000002aeae50>
     (NoMethodError)
```

if we go along with the rules and we don't specify a receiver

you can just do that, in an instance method in the class definition. why? cuz there self is the instance

there's one small fly in the ointment, though

# Private setter (=) methods

```ruby
class Dog
  attr_reader :age, :dog_years
  def dog_years=(years)
    @dog_years = years
  end
  def age=(years)
    @age = years
    self.dog_years = years * 7
  end
  private :dog_years=
end
```

dog_years is a set_writer, private. the only way that it works is if you use the keyword self.

# Protected methods

A protected method is like a slightly kinder, gentler private method. The rule for pro- tected methods is as follows: you can call a protected method on an object x, as long as the default object (self) is an instance of the same class as x or of an ancestor or descendant class of x’s class.

you want one instance of a certain class to do something with another instance of its class.

# Writing and using top-level methods

```ruby
def talk
  puts "hello"
end
```

A method that you define at the top level is stored as a private instance method of the Object class. The previous code is equivalent to this:

```ruby
class Object
  private
  def talk
    puts "hello"
  end
end
```

 we have to call it without a receiver, cuz it's a private method

```ruby
def talk
  puts "Hello"
end
puts "Trying 'talk' with no receiver..."
talk
puts "Trying 'talk' with an explicit receiver..."
obj = Object.new
obj.talk
```

The first call to talk succeeds B; the second fails with a fatal error c, because it tries to call a private method with an explicit receiver.

# Predefined (built-in) top-level methods

```ruby
$ ruby -e 'p Kernel.private_instance_methods.sort'
```

puts and print are built-in private instance methods of Kernel. Object mixes Kernel
















