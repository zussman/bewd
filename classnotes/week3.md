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

####Aside
If you find shortcuts or answers to questions you're looking for, just save them to evernote or a similar service. It's a good tool for tracking stuff that you've found helpful.

####Aside #2!
You can just use ```command k``` to clear your screen, even in irb.

####Aside #3
Symbols are a little faster in Ruby, because they're reused. They take up less memory, and they are immutable. So they take up less memory.

####Aside #4
Consider taking a look at pry. for ruby. http://pryrepl.org


##Collections and Hashes
###Hashes
* Often referred to as dictionaries
* Each entry in a hash needs a **key** and a **value**.
* An array is an *ordered* list of objects.
* A hash is an *unordered* list of key and value pairs.
* Hashes are like the object-oriented dictionaries you have created in Javascript
* You can use strings for your keys, but symbols are often a better option.

Go back through the emails.
***Very cool*** way to set up keys is just to do the symbol followed by the colon and then the value:

```
person = { name: 'David', age: 26 }
```

#Wednesday - Collections, Loops, and APIs with Andrei

We are not going over classes today. Just collections, loops and APIs! We're going to work with an API and build it out. There's going to be a lot of coding today!
##Announcements
* Mikael is back next week.
* Office hours on Saturday in the afternoon, probably over Google Hangout.
* We're changing how we submit homework.

##Recap
* Variables
* Conditionals
* Iterations
* Collections

```
2.2.1 :001 > my_car = Hash.new
 => {} 
2.2.1 :002 > my_car[:make] = "Acura"
 => "Acura" 
2.2.1 :003 > my_car[:model] = "NSX"
 => "NSX" 
2.2.1 :004 > my_car[:year] = 1996
 => 1996 
2.2.1 :005 > my_car
 => {:make=>"Acura", :model=>"NSX", :year=>1996} 
2.2.1 :006 > my_car[:rims] = 'spinners'
 => "spinners" 
2.2.1 :007 > my_car
 => {:make=>"Acura", :model=>"NSX", :year=>1996, :rims=>"spinners"} 
2.2.1 :008 > my_car[:miles] = 26354
 => 26354 
2.2.1 :009 > my_car
 => {:make=>"Acura", :model=>"NSX", :year=>1996, :rims=>"spinners", :miles=>26354} 
2.2.1 :010 > my_car['color'] = 'blue'
 => "blue" 
2.2.1 :011 > my_car
 => {:make=>"Acura", :model=>"NSX", :year=>1996, :rims=>"spinners", :miles=>26354, "color"=>"blue"} 
2.2.1 :012 > 
```
Here's a way to see if a key exists in the hash:

```
2.2.1 :023 > my_car.has_key? :make
 => true 
2.2.1 :024 > my_car.has_key? 'make'
 => false 
2.2.1 :025 > 
```

* .values - Values gets the values of the hash. Values has no parameters, but many methods have properties. You'll have to get used to these.
* .empty? - Checks if the hash is empty.
* .delete - deletes a key value pair

##APIs - Application Programming Interface
A standard for how your program will communicate with Internet services. A way to pull data from a program or website.
###Working with APIs
1. Ask for some data
2. Convert it to a format you can work with
3. Do cool stuff with it!

Let's say you have a series of news stories and you want to see how often something is mentioned. The way to communcate with APIs is through HTTP protocal. It is really similar to what you're doing with a browser. APIs are typically used to just consume the data in a different format. They don't just see data or markup. They aren't interested in HTML or CSS. HTML describes how the page will look, but the API is more focused on the data.

####Rest-client
A great library in Ruby that is used to make API and HTTP calls.

##JSON
Once we get data we need it in a format that's useful. The common format that APIs return is JSON (JavaScript Object Notation). It's very similar to the Ruby hash. We'll use a ruby library called JSON that will convert actual JSON to a format that Ruby can read.

* **require** - pulls a library into your program.