# 4 Modules and program organization

this chapter covers
- encapsulation of behavior in modules
- modular extension of classes
- the object method-lookup path
- handling method-lookup failure
- establishing namespaces with modules and nesting

a module is a Ruby construct

Like classes, modules are bundles of methods and constants

the Class class is a subclass of the Module cass, so every class object is also a module object.

The Kernel module that contains the majority of the methods common to all objects.

```ruby
module MyFirstModule
  def say_hello
    puts "hello"
  end
end
```

modules get mixed in to classes, using either the include method or the prepend method

the result of mixing in a module is that instances of the class have access to the instance methods defined in the module

```ruby
class ModuleTester
  include MyFirstModule
end

mt = ModuleTester.new
mt.say_hello
```

the main difference between inheriting from a class and mixing in a module is that you can mix in more than one module.

# A module encapsulating "stacklikeness"
A stack is a data structure that operates on the last in, first out (LIFO) principle.
queres are first in first out (FIFO) behavior

several classes can access methods of a module

```ruby
module Stacklike
  def stack
    @stack ||= []
  end
  
  def add_to_stack(obj)
    stack.push(obj)
  end

  def take_from_stack
    stack.pop
  end
end
```

```ruby
# stacklike.rb
require_relative "stacklike"
class Stack
  include Stacklike
end
```

require and load are locating and loading disk files, whereas include and prepend perform a program-space, in-memory operation that has nothing to do with files.

```ruby
require_relative "stacklike"

class Suitcase
end

class CargoHold
  include Stacklike
  def load_and_report(obj)
    print "Loading object "
    puts obj.object_id

    add_to_stack(obj)
  end

  def unload
    take_from_stack
  end
end
```

# Modules, classes, and method lookup
objects don't have methods but, rather, find them by searching classes and modules

# illustrating the basics of method lookup

```ruby
module M
  def report
    puts "'report' method in module M"
  end
  class C
    include M
  end
  class D < C
  end
  obj = D.new
  obj.report
end
```

I’m a Ruby object, and I’ve been sent the message 'report'. I have to try to find a method called report in my method lookup path. report, if it exists, resides in a class or module.
I’m an instance of a class called D. Does class D define an instance method report? No.
Does D mix in any modules?
No.
Does D’s superclass, C, define a report instance method? No.
Does C mix in any modules?
Yes,M.
Does M define a report method? Yes.
Good! I’ll execute that method.

if method not found, a special method called is triggered method_missing.

# how far the method search go?
the search of the method can always go as far up as BasicObject
but BasicObject doesn't tell you much. You have to look at Object. More precisely, you have to look at Kernel, a module that Object mixes in.

it's in Kernel (as its name suggests) that most of Ruby's fundamental methods objects are defined.

And because Object mixes in Kernel, all instances of Object and all descendants of Object have access to the instance methods in Kernel

the internal definitions of BasicObject, Object and Kernel are written in the C language

the internal definitions of BasicObject, Object and Kernel are written in the C language.

```ruby
class BasicObject
  # a scant seven method definitions go here
end
module Kernel
  # over 100 method definitions go here!
end
class Object < BasicObject
  # one or two private methods go here,
  # but the main point is to mix in the Kernel module
  include Kernel
end
```

```ruby
module M
  def report
    puts "'report' method in module M"
  end
end module N
  def report
    puts "'report' method in module N"
end end
class C
  include M
  include N
end
```

N wins

The first report method encountered in c's method lookup path is the one in the most recently mixed-in module.

re-including a module does not do anything. first inclusion wins

in all the examples so far, we've been using include to mix in modules. It's time to bring preprend back into the discussion

# How prepend works

Every time you include a module in a class, you’re affecting what happens when instances of that class have to resolve messages into method names. The same is true of prepend. The difference is that if you prepend a module to a class, the object looks in that module first, before it looks in the class.

```ruby
module MeFirst
  def report
    puts "Hello from module!"
  end
end
class Person
  prepend MeFirst
  def report
    puts "Hello from class!"
  end
end
p = Person.new
p.report
```

list of class's ancestors

```ruby
Person.ancestors
=> [MeFirst, Person, Object, Readline, Kernel, BasicObject]
```

if you use include, order changes

To resolve a message into a method, an object looks for the method in
1 Modules prepended to its class, in reverse order of prepending
2 Its class
3 Modules included in its class, in reverse order of inclusion
4 Modules prepended to its superclass
5 Its class’s superclass
6 Modules included in its superclass
7 Likewise, up to Object (and its mix-in Kernel) and BasicObject

what about singleton methods?
You’re familiar from chapter 3 with the singleton method—a method defined directly on an object (defobj.talk)—and you may wonder where in the method-lookup path singleton methods lie. The answer is that they lie in a special class, created for the sole purpose of containing them: the object’s singleton class. We’ll look at singleton classes in detail later in the book, at which point we’ll slot them into the method- lookup model.

# Going up the method search path with super
Inside the body of a method definition, you can use the super keyword to jump up to the next-highest definition in the method-lookup path of the method you’re cur- rently executing.

```ruby
module M
  def report
    puts "'report' method in module M"
  end
end class C
include M
b
c
    def report
    puts "'report' method in class C"
    puts "About to trigger the next higher-up report method..."
    super
    puts "Back from the 'super' call."
end end
c = C.new e c.report
```

```ruby
'report' method in class C
About to trigger the next higher-up report method...
'report' method in module M
Back from the 'super' call.
```

Sometimes, particularly when you’re writing a subclass, a method in an existing class does almost but not quite what you want. With super, you can have the best of both worlds by hooking into or wrapping the original method, as the next listing illustrates.

```ruby
class Bicycle
  attr_reader :gears, :wheels, :seats
  def initialize(gears = 1)
    @wheels = 2
    @seats = 1
    @gears = gears
  end 
end

class Tandem < Bicycle
  def initialize(gears)
    super
    @seats = 2
  end
end
```

# The method_missing method

it's in the Kernel module

It’s easy to intercept calls to missing methods. You override method_missing, either on a singleton basis for the object you’re calling the method on, or in the object’s class or one of that class’s ancestors:

```ruby
o = Object.new

def o.method_missing(m, *args)
  puts "you cant call #{m}"
end
```

```ruby
class Student
  def method_missing(m, *args)
    if m.to_s.start_with?("grade_for_")
      # return the appropriate grade, based on parsing the method name
    else 
      super
    end 
  end
end
```

```ruby
require "pry"
  1 
  2 class Person
  3   PEOPLE = []
  4   attr_reader :name, :hobbies, :friends
  5 
  6   def initialize(name)
  7     PEOPLE << self
  8     @name = name
  9     @hobbies = []
 10     @friends = []
 11   end
 12 
 13   def has_hobby(hobby)
 14     @hobbies << hobby
 15   end
 16 
 17   def has_friend(friend)
 18     @friends << friend
 19   end
 20 
 21   def self.method_missing(m, *args)
 22           binding.pry
 23   end
 24 end
 25 
 26 j = Person.new("John")
 27 p = Person.new("Paul")
 28 g = Person.new("George")
 29 r = Person.new("Ringo")
 30 j.has_friend(p)
 31 j.has_friend(g)
 32 
 33 g.has_friend(p)
 34 r.has_hobby("rings")
 35   
 36 Person.all_with_friends(p)
 37 Person.all_with_friendos(p)
```

a class can have onlye one superclass, but it can mix in as many modules as it wants.

# Nesting modules and classes

```ruby
module Tools
  class Hammer
  end
end
```

h = Tools::Hammer.new



