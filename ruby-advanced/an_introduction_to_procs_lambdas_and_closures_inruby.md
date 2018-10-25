

RubyReloaded.com

what are pocs, what are lambdas and closure?

examples

we know blocks
nameless functions

```ruby
arr = [1,2,3,4]

arr.each do |el|
  puts el
end
```

you can use curly braces for that, one liner

behind the scence, each its an iterator method, that accepts a block. for each method, the block is called

we can do our own methods to accept blocks

```ruby

def run_block
  yield
end

run_block do
  puts "Hello world"
end
```

run_block, calling the method, passing the block, and yield calls the block

if we dont pass the block, error

no block given on the yield

yield is looking for a code block

we can use

yield if block_given?

extend example

```ruby
class Array
  def randome_each
    shuffle.each do |el|
      yield el
    end
  end
end

[1,2,3,4,5].randome_each do |el|
  puts el
end
```

new example


```ruby
class Array
  def randome_each(&b)
    shuffle.each do |el|
      b.call el
    end
  end
end

[1,2,3,4,5].randome_each do |el|
  puts el
end
```


something weird in the last of parameters

ampersand and argument means, any code block that is pass to this method, will be assigned to this variable

b is gonna be a reference to this code block

b.call, we need to pass the element

what is b?

p b

is a Proc!
a proc object, its a nameless anonymours function or block of code, that can be represented as an object and can be passsed around and called at will

the big difference between procs and blocks

you can pass only a single block to a method at a time

restriction in ruby

you can pass multiple procs around

procs are regular objects

```ruby
def run_two_procs(a, b)
  a.call
  b.call
end

proc1 = Proc.new do
  puts "This is proc1"
end

proc2 = Proc.new do
  puts "This is proc2"
end

run_two_procs proc1, proc2
```
if you have a method that is passed as a code block, we can use the yield, or the &b,

&b converts the code block into a proc!

(a,b) is because we did Proc.new!

there is a third way

```ruby
def run_block
  p = Proc.new
  p.call
end

run_block do
  puts "Hello World"
end
```

Proc.new without a code block, this will see if in the current scope, a code block was passed

all is implicitely done

if you don't pass the block, error

4 ways of calling a proc

```ruby
my_proc = Proc.new do |a|
  puts "This is my proc and #{a} was passsed to me"
end

my_proc.call(10)
my_proc.(20) # convert to a call, synonim
my_proc[30]
my_proc === 40 # case equality operator, case statement
```

example:

```ruby
several = Proc.new { |number| number > 3 && number < 8 }
many = Proc.new { |number| number > 3 && number < 8 }
few = Proc.new { |number| number == 3 }
couple = Proc.new { |number| number == 2 }
none = Proc.new { |number| number == 0 }

0.upto(10) do |number|
  print "#{number} items is "

  case number
  when several
    puts "several"
  when many
    puts "many"
  when few
    puts "a few"
  when couple
    puts "a couple"
  when none
    puts "nnone at all"
  else
    puts "awesome"
  end
end
```

several === number

it calls the several proc, it passes number

4..7 === 5

# LAMBDAS

they are proc object, but couple of different behaviours

```ruby
hello = lambda do
  puts "this is proc1"
end

hello.call
```

before we had:

```ruby
hello = Proc.new do
  puts "this is proc1"
end

hello.call
```

i could even do

```ruby
hello = proc do
  puts "this is proc1"
end

hello.call
```

proc is a short way of Proc.new

back to lambdas

```ruby
hello = lambda do
  puts "this is proc1"
end

hello.call
```

what's the difference between procs?

lambdas inforce parity

number of parameters and arguments match up

lambda is called with as many arguments as it expects to receive

```ruby
hello = lambda do |a,b,c|
  puts "this is proc1"
end

hello.call
```


wrong number of arguments

it's like a method

if we change to proc

```ruby
hello = proc do |a,b,c|
  puts "this is proc1"
end

hello.call
```

it works fine

procs does not complain

a,b,c are set to nil

antoher key differentis in

return semantics

demo

```ruby
def run_a_proc(p)
  puts "Starting to run a proc"
  p.call
  puts "Finished running the proc\n\n"

end

run_a_proc lambda { puts "I'm a lambda"; return }
run_a_proc proc { puts "I'm a proc"; return }



```


results

```ruby
ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-linux]

Starting to run a proc
I'm a lambda
Finished running the proc

Starting to run a proc
I'm a proc
unexpected return
(repl):9:in `block in <main>'
(repl):3:in `run_a_proc'
(repl):9:in `<main>'
```

what's goin on

a return in a proc, will try to make a returnr from the context where the proc is defined

not where is currently running

we defined the proc in the main context

we can't return from the main context! this isno method whatsover

we can tweeik this


```ruby
def run_a_proc(p)
  puts "Starting to run a proc"
  p.call
  puts "Finished running the proc\n\n"

end

def our_program
  run_a_proc lambda { puts "I'm a lambda"; return }
  run_a_proc proc { puts "I'm a proc"; return }
end

our_program
```

we never see finished running the proc

we are return from the our_program, it goes out, and done

if we switch off the proc and the lambda

```ruby
def run_a_proc(p)
  puts "Starting to run a proc"
  p.call
  puts "Finished running the proc\n\n"

end

def our_program
  run_a_proc proc { puts "I'm a proc"; return }
  run_a_proc lambda { puts "I'm a lambda"; return }
end

our_program
```

results

```ruby
Starting to run a proc
I'm a proc
```

check out a page in ruby documentation

ruby proc

lambda query, ask a proc are you a lambda or not?

source location
tells you which line, where, a proc is defined

# Closures

what are they?
anonymous code block, or a function

local variance

```ruby
def run_proc(p)
  p.call
end

name = "Fred"
print_a_name = proc { puts name }
run_proc print_a_name
```

name exists in the outter scope
not inside the method run_proc

something magical happens. if i call p.call inside the method, somehow we have the name, so that the puts name work

this magic is called closure

whats going on

when we define name, and puts name, in this step

name is treated, put it in the closure

it can tell that we are actually using that name within that proc, and that's how it's blown in

tht's why it can be used later

example

dynamically define function behavior

```ruby
def multiple_generator(m)
  lambda do |n|
    n * m
  end
end

doubler = multiple_generator(2)
tripler = multiple_generator(3)

puts doubler[5] #=> 10
puts tripler[10] #=> 30
```
when we call multiple_generator(2)
inside the method, m exists right

we create lambda, and the m inside, will have the value of his context, in this case, the method. in our case, m is 2. AND, since lambdas work with closures, this is gonna be store, to this lambda, in this closure

that's why when we call the lambda with the 5 later on, we still have the m=2. it was in the closure

more stuff
in other languages, closures, they are implemented in data structures, that store the vars and their values, at the time the closure is created

in ruby, mearly the reference is kept, to these variables

the content of this variables can be changed, before the prpoc gets a change to run

```ruby
def run_proc(p)
  p.call
end

name = "Fred"

print_a_name = proc { puts name }

name = "John"

run_proc print_a_name
```

ruby stores a reference to the variable, not the value


















































