#Week 2 Notes continued
Robin Thomas is our sub instructor today.
##Objectives
* Distinguish between strings, integers, floats, booleans, and symbols and nil
* Distinguish between a method and a variable
* Distinguish between mutability and immutability
* Distinguish between true, false, truthy, and falsy
* Construct if / elseif / else blocks
* Give an example of syntactic sugar

##Bash Profiles
The Bash profile is something you should look into. Robin seemed keen on it, anyway.

##Ruby, what it is.
There are a lot of programming languages out there. For newbies, they are really functionally all similar. But different languages have different ways they look, so programmers will have preferences for different languages. Some give you leeway, some are *very* explicit. Some run faster than others. But until you're doing super complex stuff you don't have to worry about it. Ruby is actually made out of C, but it runs slower than C, which is really fast. Ruby is kind of an **abstraction** of C. Ruby takes out a lot of the busywork that you need for C that you don't need in Ruby.

Ruby reads things left to right and top->down. Standard format is to use two spaces rather than one tab for indentation. In JavaScript it's four, but you should really use two spaces to indent. Ruby does not take whitespace into account.

##Rails, what it is.
Rails is a **framework**. It takes care of a whole bunch of stuff that you would normally have to do. Like setting up a server, which can be really busy and tedious. A **framework** is something you insert your code into. A **library** gives you code to use. A framework would be the 3.5 essay framework from High School. It is a useful constraint system. Rails is a framework that forces you to put your code in certain ways. 
###Benefits
* Frameworks often give you functionality in the way a library would.
* Rails gives you *a lot* of additional tools that kind of make it a powerful framework/libary combo. Similarly to jQuery or Node.js
* Easy to collaborate with other people who know Rails.
* Rails is native to Ruby

##Gems
Gems are like little libraries for Ruby. There are lots of gems at rubygems.org. Like, there are billions of gems downloads.

##REPL (Read Evaluate Print Loop)
irb is a REPL. A REPL is a way of doing programming without having to write an entire script. irb allows you to do stuff directly in the terminal without you having to create a ruby file first. Data in irb will only persist as long as irb is running.

##Ruby Objects
###Variables
A variable is a container that you will put things into, mostly objects (maybe exclusively objects). **puts** prints to screen whatever you puts. Variables contains strings and numbers and other objects that you assign to them.

Variable names should mean something. You should use descriptive words for your variables. The names of variables have **semantic importance**. Semantics are super important in languages. They help other people read your code and change it. They even help "future you" figure out what the heck you were writing. "Future proofing" your code means dumbing it down. Code readability is really important. **Other people should be able to look at your code and understand what's going on.** This is *really* important when you're juggling 3,000 variables.

####Pointers
Variables are stored on your computer's memory. They are really pointers. The variable points to a specific spot in your memory. You can do ```variable.object_id``` to see the specific numeric spot where it is stored.

```
2.2.1 :003 > a = "hello"
 => "hello" 
2.2.1 :004 > a.object_id
 => 70230189590700 
2.2.1 :005 > b = a
 => "hello" 
2.2.1 :006 > b.object_id
 => 70230189590700 
2.2.1 :007 > b = "whatever"
 => "whatever" 
2.2.1 :008 > b.object_id
 => 70230189720740 
2.2.1 :009 > 
````
###Integers, Strings, Floats, Booleans, Symbols, & nil
Ruby has different types of data that it can hold. Integers are numbers (with no quotes!) and no decimal point. Strings are anything with quotation marks around them. Booleans are a data type that say whether something is 'true' or 'false'. In Ruby there isn't actually a Boolean class. There is ```TrueClass``` and ```FalseClass```.
####String and Integer Classes

```
2.2.1 :011 > username = "Robin"
 => "Robin" 
2.2.1 :012 > age = 46
 => 46 
2.2.1 :013 > username.class
 => String 
2.2.1 :014 > age.class
 => Fixnum 
 ```
 
####Boolean Classes (and memory usage)
 
 ```
 2.2.1 :015 > bananas = true
 => true 
2.2.1 :016 > bananas.class
 => TrueClass 
2.2.1 :017 > bananas = false
 => false 
2.2.1 :018 > bananas.class
 => FalseClass 
2.2.1 :019 > bananas.object_id
 => 0 
2.2.1 :020 > bananas = true
 => true 
2.2.1 :021 > bananas.object_id
 => 20 
2.2.1 :022 > 
```
\* Coding is *really* difficult. You have to learn the 'how' first before you can learn the 'why'. That's because there is a ton to learn about programming. This is really important to keep in mind as you learn.

####Floats
Floats are just decimal places. They take up more memory because they're more precise. Obviously, the same is true for integers, but I don't think we need to worry too much about why floats take up more memory. They just do. Get used to it.

```
2.2.1 :022 > 1.1.class
 => Float 
 ```

####Symbols
Unique to Ruby (maybe). Symbols are **immutable**. They are a lot like strings. A symbol is represented by a colon followed by something (but that something has to begin with a letter, and it can only have letters, numbers, and underscores (aka snake_case or camelCase)). Things in Ruby are usually named with snake_case rather than camelCase. A **variable** can be a **symbol**.

####nil
nil is the class of something that has *no value*. Something that has a value of 0 is not nil. But something that is assigned to the nil value is.

#####Why use Symbols
Symbols use less memory. They will never change, so it is a bit easier to access than a string. They are typically fewer characters.

```
2.2.1 :023 > is_mikael_cool = :yes
 => :yes 
2.2.1 :024 > is_mikael_cool.object_id
 => 794588 
2.2.1 :025 > is_david_cool = :yes
 => :yes 
2.2.1 :026 > is_david_cool.object_id
 => 794588 
 ```
##Classes
A class is a type of object within Ruby. There are a bunch of types of objects, of which numbers, strings, booleans, floats, and symbols are a few examples.

##Methods
Methods are "mini-machines that do stuff".

---
##Class Exercise (If statements)
We ran an if statement ruby that I named if_statements.rb. Check it out if you're interested.
It goes through the ```if```, ```elsif``` ```else``` situations that you can create. You can only run comparisons with ```if``` and ```elsif```. You don't need an ```else``` or an ```elsif```.

---

##Syntactic Sugar
Synactic sugar means that you have greater flexibility in how you write stuff. So you don't need parenthesis around your comparisons. A lot of programmers like that. They think it adds flavor and makes the language better. Others like more structured languages.

##Truthy and falsy
You don't need a comparison. You can run an if statement that just checks if the variable exists and has value.
###Falsy
* nil
* false

```
name = nil

if name
  puts "Name exists!"
else
  puts "Thing does not exist"
end
```

###Truthy
* string
* integer
* boolean
* symbol
* float

```
name = true

if name
  puts "Name exists!"
else
  puts "Thing does not exist"
end
```
##Comparisons
* equals --> ==
* does not equal --> !=

##Interpolation
Alternate way of including ruby in a string. This is an example of syntactic sugar and it plays a role in rails.

```
name = gets.chomp

puts "Hello, #{name}""
```

---
##FizzBuzz Class Exercise
We did the FizzBuzz exercise in class. I saved it as fizzbuzz.rb in the classwork folder for Week 2. The guy next to me thought of a bunch of use cases that would fail if they entered it:
* Negative numbers
* Strings
* Strange characters

---

##What are Methods?
Methods are the same as 'functions' in JavaScript. A Method takes inputs and performs actions using the inputs to create an output. A Method can only use variables that come from arguments or that are defined within the method itself. The ability to pass arguments into a method is a really powerful idea.

You can assign a variable as equal to a method. Then, when you call the variable it will run the method.

####Toaster example (method.rb)

```
def toaster(tray)
  return "#{tray} is now toasty!"
end

puts "Insert some bread."

bread = gets.chomp

puts toaster(bread)
```
###Returns
Every method in Ruby has to return something. A method can only return one thing. When it gets to the return it will stop. So anything that is written inside the method after the return will not actually happen. Ruby will stop after return. But things that are written before the return will happen.

If you don't actually put a return statement into a method, then it will return the last value that was returned within the method. That is the difference between **implicit returns** and **explicit returns**. It is best practice to specify what is being returned with explicit returns.

###Side Effects
A method will always return something. It might also have a side effect. It isn't something that is being returned, just something that happens as a result of the method. Ruby methods *may* have side effects.

###Bangs!
```
integer.upcase!
```
is the same as 

```
integer = integer.upcase
```
This is really important to know, because you'll probably see people use the bang all the time in their code (it's called a bang). Bangs do not work with everything. We tried to do it with the ```to_i``` method and it didn't work.


