# 6 control-flow techniques

this chapter covers

- conditional execution
- loops and looping techniques
- iterators
- exceptions and error handling

# the if keyword and friends

```ruby
if condition
  # code here, executed if condition is true
end
```

```ruby
if x > 10 then puts x end
```

```ruby
if x > 10; puts x; end
```

```ruby
if condition
  # code executed if condition is true
else
  # code executed if condition is false
end
```

```ruby
if condition1
  # code executed if condition1 is true
elsif condition2
  # code executed if condition1 is false
  # and condition2 is true
elsif condition3
  # code executed if neither condition1
  # nor condition2 is true, but condition3 is 
end
```

you can add an else if you have some elsifs. The else clause is executed if none of the previous tests for truth has succeeded

# Local variable assignment in a conditional body

```ruby
if false
  x = 1
end
p x
p y
```

x is not assigned, but the ruby parser allocates space for the var x in memory. It reserves the space.
The value of x is nil
the value of y is undefined

# pattern matching with the match method
```ruby
name = "David A. Black"
if m = /la/.match(name)
  puts "Found a match!"
  print "Here's the unmatched start of the string: "
  puts m.pre_match
  print "Here's the unmatched end of the string: "
  puts m.post_match
else
  puts "No match"
end
```

The match method looks for the pattern la in the string "David A. Black".

# case statements

````ruby
print "Exit the program? (yes or no): "
answer = gets.chomp
case answer
when "yes"
  puts "Good-bye!"
when "no"
  puts "OK, we'll continue"
else
  puts "That's an unknown answer -- assuming you meant 'no'"
end
puts "Continuing with program..."
```

u can do

```ruby
when "y", "yes"
```

# How when works

every Ruby object has a case equality method called === (threequal operator). The outcome of calling the === method determines whether a when clause has matched.

```ruby
if "yes" === answer
  puts "Good-bye!"
  exit
elsif "no" === answer
  puts "OK, we'll continue"
else
  puts "That's an unknown answer—assuming you meant 'no'"
end
```

The === is syntactic sugar for a method call

```ruby
if "yes".===(answer)
```

A when statement wraps that method call in yet more sugar.o

For strings, the threequal compares char by char.o

Implementing case statement behavior for the Ticket class

```ruby
class Ticket
  attr_accessor :venue, :date
  def initialize(venue, date)
    self.venue = venue
    self.date = date
  end
  def ===(other_ticket)
    self.venue == other_ticket.venue
  end 
end
ticket1 = Ticket.new("Town Hall", "07/08/13")
ticket2 = Ticket.new("Conference Center", "07/08/13")
ticket3 = Ticket.new("Town Hall", "08/09/13")
puts "ticket1 is for an event at: #{ticket1.venue}."
case ticket1
when ticket2
  puts "Same location as ticket2!"
when ticket3
  puts "Same location as ticket3!"
else
  puts "No match"
end
```

output

```ruby
ticket1 is for an event at: Town Hall.
Same location as ticket3!
```

# The simple case truth test

```ruby
case
when user.first_name == "David", user.last_name == "Black"
  puts "You might be David Black."
when Time.now.wday == 5
  puts "You're not David Black, but at least it's Friday!"
else
  puts "You're not David Black, and it's not Friday."
end
```

# Repeating actions with loops

# Unconditional looping with the loop method

does not take arguments, it takes a block

```ruby
loop { puts "Looping forever!" }
```

```ruby
loop do
  puts "Looping forever!"
end
```

```ruby
n=1 
loop do
  n=n+1
  break if n > 9
end
```

You can skip iterations with the keyword next

# Conditional looping with the while and until keywords

```ruby
n=1
while n < 11
  puts n
  n=n+1 
end
puts "Done!"
```

As long as the condition n < 11 is true, the loop executes.

```ruby
n=1 
begin
  puts n
  n=n+1
end while n < 11 
puts "Done!"
```

# Looping based on a list of values
for / in

```ruby
celsius = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
puts "Celsius\tFahrenheit"
for c in celsius
  puts "#{c}\t#{Temperature.c2f(c)}"
end
```

A loop is an iterator. An iterator is a Ruby method that has an extra ingredient in its calling syntax: it expects you to provide it with a code block.

The loop method has access to the code inside the block: the method can call (execute) the block. 

Loop is written in C.

# Iteteration, home-style

The job of loop is to yield control to the code block, again and again.

```ruby
def my_loop
  while true
    yield
  end
end
```

````ruby
my_loop { puts "My-looping forever!" }
```

When the method yields to the bloc, the code in the block runs.o
The code block is part of the method call.
A code block is not an argument. Is a code block.

# The anatomy of a method call

■ A receiver object or variable (defaulting to self if absent)
■ A dot (required if there’s an explicit receiver; disallowed otherwise)
■ A method name (required)
■ An argument list (optional; defaults to ())
■ A code block (optional; no default)

The difference between a method call with a block and a method call without a block comes down to wheather or not the method can yield

# Implementing times
The times method is an instance method of the Integer class, which means you call it as a method on integers.

```ruby
class Integer
  def my_times
    c = 0
    until c == self
      yield(c)
      c += 1
    end
    self
  end
end
```

# The importance of being each

```ruby
array = [1,2,3,4,5]
array.each {|e| puts "The block just got handed #{e}." }
```

When each isn't given a block, it returns an enumerator, otherwise, the array

```ruby
class Array
  def my_each
    c = 0
    until c == size
      yield(self[c])
    end
  end
  return self
end
```

# From each to map

The difference between each and map lies in the return value: each returns its receiver, but map returns a new array

```ruby
15 class Array
 14   def my_each
 13     c = 0 
 12     until c == self.size
 11       yield(self[c])
 10       c += 1 
  9     end
  8     return self
  7   end
  6 
  5   def my_map
  4     acc = []
  3     self.my_each do |e|
  2       acc << yield(e) 
  1     end
16      acc
  1   end
  2 end
```

# Block parameters and variable scope

```ruby
def block_scope_demo
  6   x = 100
  5   1.times do
  4     puts x 
  3   end
  2 end
  1 
8   block_scope_demo
```

we see the 100!

```ruby
def block_scope_demo_2
  x = 100
  1.times do
    x = 200
  end
  puts x 
end
block_scope_demo_2
```

output: 200

Blocks have direct access to variables that already exist. However, block parameters (the variable names between the pipes) behave differently from non-paramter variables. They are not the same as the previously defined var.

Ruby provides a special notation indicating that you want one or more variables to be local to the block, even if varaibles with the same name already exist: a semicolon in the block parameter list.

```ruby
def block_local_variable
  x = "Original x!"
  3.times do |i;x|
    x=i
    puts "x in the block is now #{x}"
  end
  puts "x after the block ended is #{x}"
end
block_local_variable
```

the variables listed after the semicolon aren't considered block parameters. They don't get bound to anything when the block is called. They're reserved names

don't forget

```ruby
def block_scope_demo
  5   x = 100
  4   1.times do
  3     puts x 
  2     x = "albert"
  1   end
7     puts x
  1 end
  2 
  3 block_scope_demo
```

# Error handling and exceptions

for syntax errors:

```ruby
ruby -cw filename.rb
```

# Raising and rescuing exceptions

an exception is a special object, an instance of the class Exception
Raising an exception means stopping normal execution of the program and either dealing with the problem that's been encountered or exiting the program completely.

to deal with the problem you provide a rescue clause. If yo don't provide a rescue clase, the program terminates

if you divide by zero, it raises an exception. The ZeroDivisionError, this is a descendant class of the class Exception

# some common exceptions

- RuntimeError
- The default exception raised by the raise method
- raise

- NoMethodError
- an object is sent a message it can't resolve to a method name; the default method_missing raises this exception.
- a = Object.new / a.some_unknnown_method_name

- NameError
- The interpreter hits an identifier it can't resolve as a variable or method name
- a = some_random_identifier

- IOError
- Caused by reading a closed stream, writing to a read-only stream, and similar operations.
- STDIN.puts("Don't write to STDIN!")

- Errno::error
- A family of errors relates to file I/O
- File.open(-12)

- TypeError
- A method receives an argument it can't handle
- a = 3 + "can't add a string to a number!"

- ArgumentError
- Caused by using the wrong number of arguments
- def m(x); end; m(1,2,3,4,5)

# The rescue keyword to the rescue!

rescuing involves a rescue block, which is delimited with the begin and end keywords and has a rescue clause in the middle

```ruby
print "Enter a number: "
n = gets.to_o
begin
  result = 100 / n
rescue
  puts "Your number didn't work. Was it zero???"
  exit
end
puts "100/#{n} is #{result}."
```

the exception ZeroDivisionError is raised, but since it's inside the begin end block, with a rescue clause, the control is passed to the rescue clause.

you can refine this technique with

```ruby
rescue ZeroDivisionError
```

# Using rescue inside methods and code blocks

the beginning of a method or a code block provides an implicit begin/end context

```ruby
def open_user_file
  print "File to open: "
  filename = gets.chomp
  fh = File.open(filename)

  yield fh
  fh.close
  rescue
    puts "Couldn't open your file!"
end
```

it is triggered when we try to open it!

but if we have an exception elsewhere, it is also raised, that's wy is better:


```ruby
def open_user_file
  print "File to open: "
  filename = gets.chomp

  begin
    fh = File.open(filename)
  rescue
    puts "Couldn't open your file!"
    return
  end
  yield fh
  fh.close
end
```

the rescue clause only governs what comes between begin and end

# Raising exceptions explicitly
to raise an exception you use raise
default, ruby raises RuntimeError

you can give raise a second argument, which is used as the message string when the exception is raised:

```ruby
def fussy_method(x)
  raise ArgumentError, "I need a number under 10" unless x < 10
end
fussy_method(20)
```

```ruby
begin
  fussy_method(20)
rescue ArgumentError
  puts "That was not an acceptable number!"
end
```

# Capturing an exception in a rescue clause

to assign the exception object to a variable, you use =>

useful methods are backtrace and message.
backtrace returns an array of string srepresenting the call stack at the time the exception was raised.

```ruby
begin
  fussy_method(20)
rescue ArgumentError => e
  puts "That was not an acceptable number!"
  puts "Here's the backtrace for this exception:"
  puts e.backtrace
  puts "And here's the exception object's message:"
  puts e.message
end
```

output:

```ruby
That was not an acceptable number!
Here's the backtrace for this exception:
fussy.rb:2:in `fussy_method'
fussy.rb:6:in `<main>'
And here's the exception object's message:
I need a number under 10
```

exception raising is class-based with the naming, but ou area really using instances. 

# Re-raising an exception

```ruby
begin
  fh = File.open(filename)
rescue => e
  logfile.puts("User tried to open #{filename}, #{Time.now}")
  logfile.puts("Exception: #{e.message}")
  raise
end
```

no argument in raise, it re-raise the exception in the clause

# The ensure clause





















