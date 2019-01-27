# 3 Organizing objects with classes

this chapter covers

- creating multiple objects with classes
- setting and reading object state
- automating creation of attribute read and write methods
- class inheritance mechanics
- syntax and semantics of Ruby constants

creating an object and equipping it with methods was awesome, but not scalable. for that, we use classes

defining a class lets you group behaviors (methods).

everything you handle in Ruby is either an object or a construct that evaluates to an object, and every object is an instnace of some class.

classes are objects

since classes are objects, they can respond to methods

# instance methods
are define inside the class, for all the instnaces

# singleton methods
def ticket.price is a singleton method
methods defined in a particular object

# instance variables and object state

Ruby objects come with their own storage and retrieva mechanism for values: instance variables

instance variable mantain the value, even outside the method

# setter methods
there's more to it, though. Ruby has some specialized method-naming conventions that let you write setter methods in a way that's more elegant than sticking `set_` in front of a descriptive word like name.

# the equal sign (=) in method names

```ruby
class Ticket
  def initialize(venue, date)
    @venue = venue
    @date = date
  end
  def set_price(amount)
    @price = amount
end
def price
@price end
end

```

this works

Ruby allows you to define methods that end with an equal sign (=).

```ruby
def price=(amount)
  @price = amount
end
```

price= does exactly what set_price did

```ruby
ticket.price=(63.00)
```

it looks odd, but works

with syntactic sugar:

```ruby
ticket.price = 63.00
```

ruby has some shortcuts to write setters and getters

# 3.4 Attributes and the attr_ method family

an attribute is a property of an object whose value can be read and/or written through the object.

there are attribute writer & attribute readers

the attributes of Ruby objects are implemented as reader and/or writer methods wrapped around instance variables

Ruby does embed the concept of attributes in the language, in the form of shortcuts that help you write the methods that implement them

```ruby
class Ticket
  attr_reader :venue, :date, :price
  attr_writer :price
end
```

In the abscene of an explicit receiver, messages go to self

so the object receiving the attr_reader message is the actual class object Ticket

```ruby
class Ticket
  attr_reader :venue, :date
  attr_accessor :price
end
```

# inheritance and the ruby class hierarchy

```ruby
class Publication
  attr_accessor :publisher
end

class Magazine < Publication
  attr_accessor :editor
end
```

objects get their behaviors from their classes, from their individual or singleton methods, and also form the ancestors (superclass) of their classes

inheritance has an important limitation, though.

# Single inheritance: One to a customer

ruby does not allow multiple inheritance. every Ruby class can habe onlye one superclass

But, Ruby provides modules, which are bundles of programming functionality similar to classes. and then you can require them in your class, to enhance the group of methods in the module

if you define a class, he is a subclass of Object

BasicObject comes before Object in the Ruby class family tree

it's a kind of blank-slate object, an object with almost no methodsit has just 8 methods, where the Object class has 55 instance methods.

objects serve as receivers of messages

classes are objects and can therefore serve as receivers of messages, just like other objects

# Classes as objects and message receivers

classes are special objects: they are the only kind of object that has te power to spawn new objects (instances).

Every class -Object, Person, Ticket- is an instance of a class called Class

```ruby
class Ticket
  # your code
end
```

u could do

```ruby
my_class = Class.new
```

we have a class object. that class can create instancess of its own

```ruby
instance_of_my_class = my_class.new
```

to create an anonymous class using Class.new

````ruby
c = Class.new do
  def say_hello
    puts "hello"
  end
end
```

# the class/object chicken-or-egg paradox

every object has an internal record of what class it's an instance of, and the internal record inside the object Class points back to Class itself

# How class objects call methods

when you send a message to a class object, it looks like this

````ruby
Ticket.some_message
```

or like attr_accessor

```ruby
class Ticket
  some_message
```

Instances of Class can call methods that are defined as instance methods in their class. Ticket, for example, is an instance of Class, and Class defines an instance method called new. That's why we can write:

```ruby
Ticket.new
```

The superclass of Class is Module. Instances of Class therefore have access to the instance methods defined in Module; among these are the attr_accessor family of methods.

# a singleton method by any other name

```ruby
def Ticket.most_expensive(*tickets)
  tickets.max_by(&:price)
end
```

```ruby
th = Ticket.new("Town Hall","11/12/13")
cc = Ticket.new("Convention Center","12/13/14/")
fg = Ticket.new("Fairgrounds", "13/14/15/")
th.price = 12.55
cc.price = 10.00
fg.price = 18.00
highest = Ticket.most_expensive(th,cc,fg)
puts "The highest-priced ticket is the one for #{highest.venue}."
```

the method most_expensive is defined directly on the class object Ticket, in singleton-method style

A singleton method defined on a class object is commonly referred to as a class method of the class on which it's defined.

# Constants up close
Constants can also be used to set and preserve important data values in classes

constants are defined inside classes

you can call them outside the class, if you do this

```ruby
puts Ticket::VENUES
```

ruby has predefined constants that you can access, like Math::PI
Math is a moduel

# Reassigning vs. modifiying constants
you get a warning

it's useful for the language to have a separate category for constants, as a way of storing data that remains visible over a longer stretch of the program than a regular varaible.

But, ruby is a dynamic language. Everything changes

```ruby
venues = Ticket::VENUES
venues << "High School Gym"
```

here there is no redefinition of the constant. we are just modifiyng the array. the array does not know that he was assigned to a constant.

use respond_to? for methods created on the go



