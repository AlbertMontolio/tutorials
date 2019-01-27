# Objects, methods, and local variables

this chapter covers:

- objects and object orientation
- innate versus learned object capabilities
- method parameter, argument, and calling syntax
- local variable assignment and usage
- object references

classes build multiple objects with similar behaviours

but in ruby, every object has the potential of learning new behaviors (methods).

define a method for your object

```ruby
def obj.talk
  puts "i am an object"
end
```

# sending messages to objects

dot-based message-sending syntax (or method-calling syntax)

```ruby
p Object.new.methods.sort

Object.new.object_id

obj = Object.new
def obj.talk
  puts "eee"
end

obj.talk

obj.respond_to :talk
```

# sending messages to objects with the send method
what if you don't know which message you want to send?
suppose you want to let a user get information from the ticket object by entering an appropiate query term (venue, performer, and so on) at the keyword.

```ruby
print "Information desired: "
request = gets.chomp

if ticket.respond_to? request
  puts ticket.send request
else
  puts "no such ifnormation avaiable"
end
```

# using __send__ or public_send instead of send

sometimes u have a send method. then use __send__

method that allows multiple arguments

```ruby
def obj.multi_args(*x)
  puts "i can take zero or more arguments"
end
```

x is an array, you can get the elements there

```ruby
def default_args(a,b,c=1)
  puts "aaaa"
end
```

if you don't supply c, than 1

just x = 1 holds the value itself.

```ruby
str = "hola"
test = str
```

test holds a reference to the same object that str is pointing to

# references and method arguments

```ruby
def change_string(str)
  str.replace("new string content")
end

s = "original string content"
change_string(s)

puts s
#=> "new string content"
```

you pass the reference!

there is a way of protecting objects from being changed

# Duping and freezing objects
if you want to protect objects from being changed inside methods to which you send them, you can use the dup method, which duplicates an object

```ruby
s = "original string content"
change_string(s.dup)
puts s
```

it duplicates the object

you can also freeze an object, so now the method would raise an error -> RuntimeError: can't modify frozen string

```ruby
s = "original string content"
s.freeze
change_string(s)
```

there is also clone. it's a lot like dup

if you clone a frozen object, the clone is also frozen, whereas if you dup a frozen object, the duplicate isn't frozen.

if you freeze an array, you can change the objects inside

for example, with the replace

