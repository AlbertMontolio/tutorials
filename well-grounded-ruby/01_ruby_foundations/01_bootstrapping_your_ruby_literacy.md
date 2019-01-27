# Bootstrapping your Ruby literacy

ruby is truthy. just nil and false return false.
0 and empty string return true

Variables:
  - local
  - instance
  - class
  - global
Constants
Kewwords
Method names

instance variables: serve the purpose of storing information for individual objects, always start with a single at sign (@)

class variables: @@running_total

Global variables: $FIRST_NAME

with the dot, we send messages to the object

"100".to_i

"100" is the receiver. the message to_i is being sent to the string "100"

a class instantiates an object with some behavior. but this object can get new methods, that are not in the class. cuz ruby is so dynamic

puts is a module method of Kernel. Kernel is included by Object so it's available from nearly every class. puts "foo" and Kernel.puts "foo" are equivalent. The difference is Kernel.puts is explicit while puts could call a locally defined puts method.

```ruby
def puts(str)
  p "my puts: #{str}"
end

puts "foo";        # "my puts: foo"
Kernel.puts "foo"  # foo
```

Under the hood, Kernel.puts calls $stdout.puts. $stdout is a predefined global instance of IO.

syntax check in a ruby file

```ruby
ruby -cw c2f.rb
```

-c: check for syntax errors
-w: activates a higher level of warning

print fahrenheit, "\n"

same as puts

read from a file

```ruby
puts "Reading Celsius temperature value from data file..."
num = File.read("temp.dat")
celsius = num.to_i
```

writing in a file

```ruby
fh = File.new("temp.out", "w")
fh.puts fahrenheit
fh.close
```

find where ruby is installed
in the terminal

```ruby
irb --simple-prompt -rrbconfig
```

in irb

```ruby
RbConfig::CONFIG["bindir"]
```

Key Ruby directories and their RbConfig terms

```ruby
rubylibdir Ruby standard library
bindir Ruby command-line tools
archdir Architecture-specific extensions and libraries (compiled, binary files)  
sitedir Your own or third-party extensions and libraries (written in Ruby)
vendordir Third-party extensions and libraries (written in Ruby)
sitelibdir Your own Ruby language extensions (written in Ruby)
sitearchdir Your own Ruby language extensions (written in C)
```

you can write a ruby extension in C

load files

```ruby
puts "This is the first (master) program file."
load "loadee.rb"
puts "And back again to the first file."
```



Loading a file in the default load path

```ruby
ruby -e 'puts $:'                                                    [2.5.0]
/usr/local/Cellar/rbenv/1.1.1/rbenv.d/exec/gem-rehash
/Users/albert/.rbenv/versions/2.5.0/lib/ruby/gems/2.5.0/gems/did_you_mean-1.2.0/lib
/Users/albert/.rbenv/versions/2.5.0/lib/ruby/site_ruby/2.5.0
/Users/albert/.rbenv/versions/2.5.0/lib/ruby/site_ruby/2.5.0/x86_64-darwin17
/Users/albert/.rbenv/versions/2.5.0/lib/ruby/site_ruby
/Users/albert/.rbenv/versions/2.5.0/lib/ruby/vendor_ruby/2.5.0
/Users/albert/.rbenv/versions/2.5.0/lib/ruby/vendor_ruby/2.5.0/x86_64-darwin17
/Users/albert/.rbenv/versions/2.5.0/lib/ruby/vendor_ruby
/Users/albert/.rbenv/versions/2.5.0/lib/ruby/2.5.0
/Users/albert/.rbenv/versions/2.5.0/lib/ruby/2.5.0/x86_64-darwin17
```

require has some features that load does not have

require is more abstract, you don't need the extension, so it treats the same .rb or C files.
if you require same thing twice, it's not loaded twice, like load

require does not know the current working directory

```ruby
require "scanf"
```

require_relative
u load files relative to the current working directory


out of the box ruby tools and applications

ruby - the interpreter
irb - the interactive Ruby interpreter
rdoc and ri - ruby documentation tools
rake - ruby make, a task-management utility
gem - a ruby library and application package-management utilitz
erb - a templating system
testrb - a high-level tool for use with the uby test framework

ruby -h

ruby -cw name_file.rb

-c check syntax
-w full warnings, more than the usual ones

run snippet of code in a particular ruby version

```ruby
$ ruby-1.8.6-p399 -ve "puts 'abc'.start_with?('a')"
ruby 1.8.6 (2010-02-05 patchlevel 399) [x86_64-linux]
-e:1: undefined method `start_with?' for "abc":String (NoMethodError)
$ ruby-2.1.0p0 -ve "puts 'abc'.start_with?('a')"
ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-linux]
true
```

rdoc creates documentation from the comments in a ruby project

rake reads and executes tasks defined in a file, a RakeFile

```ruby
namespace :admin do
   15   desc "Interactively delete all files in /temp"
   14   task :clean_tmp do
   13     Dir["/tmp/*"].each do |f|
   12       next unless File.file?(f)
   11       print "Delete #{f}?"
   10       answer = $stdin.gets
    9       case answer
    8       when /^y/
    7         File.unlink(f)
    6       when /^q/
    5         break
--  4     end
    3   end
    2 end
    1   
>>17  # rake admin:clean_temp
```

define tasks in a Rakefile

to know which tasks you can call, run

```ruby
rake --tasks
```

there you see the command

# installing packages with the gem command

