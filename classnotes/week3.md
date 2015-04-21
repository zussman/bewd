#Week 3 Class Notes
##Collections and Loops
Today we'll do iterations and loops, arrays and hashes. Hashes are called dictionaries or maps in other languages.

###.times method
The **times** method iterates based on a number object. You can go to the source code for help! This is called a **prop**.

Use Rubinius as a guide for looking up methods you don't understand.

###Ruby style guide stuff:
* One line stuff should use {} brackets.
* Multi line stuff should use **do** and **end**.
* Always use two spaces, *not* tabs.

There are some less-common iterators, which are in the slides.

###Inline ternary
You can write an if statement in a very short space.

##Iteration
Iteration lets you keep your code DRY!
* Keeps more maintainable code.

##Arrays
Arrays are like the IKEA shelving units, says Bill! You can see all the methods for an array by writing the array name followed by a period and tabing twice in irb.

For all of the array methods, go here: http://ruby-doc.org/core-2.2.0/Array.html. When you run a method on an object (like an array) with a band "!", you can apply the method to the object itself, rather than just a one-time thing.

###The Each method
Does stuff to each element within an array.

###The Index method
The index method will find a given value in an array if it exists. IF it doesn't find the element, it will return nil.

###Map keeps your changes

You should look at each of the following methods as part of your homework:
* .map
* .index
* .each
* .pop
* .push
* .last
* .first
* .delete
* .delete_at
* .delete_if
* .unshift
* .insert
* << (for adding stuff to an array)
* .shift
* .include?
* .any? *Bill loves this one! Definitely look at it!*
* 