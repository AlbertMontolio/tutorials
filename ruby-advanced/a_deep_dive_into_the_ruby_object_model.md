ruby

https://www.youtube.com/watch?v=by5fFOBhtPQ

data + methods = an object

look primitive, but are objects
"s".upcase

every class is an instnace of a class

Fixnum.class => Class

Class.class => Class

my_class = Class.new

my_obj = my_class.new

# how objects are represented internally

all objects looks the same in a high level, but are not

```ruby
struct RObject {
  struct RBasic basic;
  struct st_table *iv_index_tbl;
}
```


MRI ruby

objects don't have methods, classes do
(internally speaking)

Fixnum.superclass => Integer

klass
every object is from a certain class, even classes itself

klass reference to whatever the class of the object is

RObject
- flags
- class reference
- instance variables
- @age = 10

RClass
- flags
- class reference
- instance variables
- methods table
- reference to 'superclass'
- constants table

```ruby
class User
  def name=(name)
    @name = name
  end

  def name
    @name
  end

end
```

setter & getter methods

the super class of User is object

if you define a class, and does not inherite from another class, automatically
User < Object

create an instance

me = User.new

me.name = "Peter Cooper"

if ruby does not find name= in the super class, goes up until

BasicObject class is the top class in Ruby

except if he finds
method_missing, then its triggered this method

```ruby
class User
  def status
    :admin
  end
end
``

me = User.new
you = User.new

def me.age
  30
end

me.age => 30
youu.age => NoMethodError

both objects point to User (RClass)

but where does me.age go?

ruby create a new special class, a singleton class
```ruby
 *me (RClass)

methods table
# age
```

it sets the super class to user

now me, class reference is not User, it's

```ruby
*me (RClass)

```

if you ask me.class, you still see User, he hides this information

but we have the singleton classes hidden in between

# Class methods

are available for all the instances, are called static methods in java or c++




```ruby
class user
  def self.plurar_name
    "users"
  end
end
```

User.plurar_name

We had the User (RClass)

```ruby
User (RClass)
superclass -> Object (RClass)
methods table
#name=
#name
klass -> *User (RClass)
```

```ruby
*User (RClass)
methods table
#plural_name

klass -> Class (RClass)
```

this is a meta class

https://stackoverflow.com/questions/4299289/what-is-the-difference-between-class-and-klass-in-ruby

difference between class and klass

# The default definee

class with a key

```ruby
class User

  p self => User

end
```

```ruby

class User
  def self.status
    :hmm
  end

  def status
    :admin
  end

end
```

why are this going to different tbales internally?

method definitions not occur on self by default

self.status, the method will be added to a singleton class, of this class

```ruby
me = User.new

me.instance_eval do
  self.name = "Fred"
end

p me.name # => "Fred"
```

```ruby
me.instance_eval do
  def age
    30
  end

end

p me.age => 30
```



if we move to the class level

```ruby
User.isntance_eval do

  def gender
    :female
  end

end

me.gender => NoMethodError
User.gender => :female
```
we are defining a method in the singleton class, not in User

if we want to do that, we use class_eval, more like creating manually. tehn is the table User itself, the class User itself

```ruby
User.class_eval do

  def gender
    :female
  end

end

me.gender => NoMethodError
User.gender => :female
```


more eval methods!



# Modules

collecitons of methods and constants. sounds like a class. are classes, without instance creation capabilities

class inherits from modules, and add more stuff, like creating insance

```ruby
module MyModule
  PI = 3.141592

  def some_method
    puts "Hello, world!"
  end
end

MyModule::PI => 3.14
MyModule.some_method => NoMethodError (eh?)


```

module is a namespace

we kind of create an instance method

we have to incluse this inside a class

```ruby
class User
  include MyModule
end

me.some_method
```

mixing in, mymodule is a mixing in

you can pick your own modules, and give extra functionalities to your classes

# modules methods

```ruby
module MyModule
  def self.some_method
    puts "Hello, world!"
  end
end

MyModule.some_method
```

this won't get included when use include

you can use the Math module name space, to store this functions

math.cos(10)

```ruby
module NamingMethods
  def name=(name)
    @name = name
  end

  def name
    @name
  end

end

class User
  include NamingMethods
end

me = User.new
me.name = "Fred"
p me.name
```

ruby does not copy all the methods in namingmethods in the class user

we can prove that

add this in your module

```ruby
module NamingMethods
  def hello
    42
  end
end

p me.hello #=> 42
```

we still get this me thing, that we added to the module

so there must be a tight, between the class and the module

ruby creates a special virtual class, called included class

iclass (reference internally)

Before

User (RClass)
superclass --> Object (RClass)
methods table
#name=
#name

NamingMethods (RModule)

methods table
#name=
#name
#hello




nowwe put this NamingMethods (IClass) between User (RClass) and Object (RClass)

NamingMethods (IClass)
superclass --> Object (RClass)
methods table --> NamingMethods (RModule)

and User(RClass) superclass -> NamingMethods (IClass)


# extend vs include

extend works in the object singleton class

```ruby
module ClassMethods
  def hello
    42
  end
end

class User
  extend ClassMethods
end

p User.hello #=> 42
```

if i'd use include, it would create that IClass

the whole instances of User would have access to the method sin the module

with extend, they are added as class methods in User

if we pack it in a object

```ruby
module SingletonMethods
  def hello
    42
  end
end

str = "hello"
str.extend SingletonMethods
p str.hello
```

add all th emethods of this modelue, to your singleton class

str.hello, it works

```ruby
module MyFunctionaliy
  def instance_meth
    puts "I'm an instance method!"
  end

  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    def class_meth
      puts "I'm a class method!"
    end
  end
end

class MyClass
  include MyFunctionality
end

p MyClass.class_meth
p MyClass.new.instance_meth #this comes thanks to the module
```

we want to have also class methods

we could use extend

extend MyFunctionality::ClassMethods

if you include a module into a class or another module, ruby looks for a module method called includeded

if it exists, it calls it, and parses in the class module that is having the inclusion dam to it

the self.included method, is called when we call the method include MyFunctionality

we pass MyClass as class

and then we do, klass.extend ClassMethods

this is a behind the scence hook































































































