#Chapter 3 - Letters
**Strings** are groups of letters in a program. Think of beads with letters on them being strung together. Here are some examples of strings:

```
'Hello.'
'Ruby rocks.'
'Nobody deserves a mime, Buffy.'
'Snoopy says @#$! when he stubs his toe.'
'       '
''
```
Strings can have punctuation, digits, symbols, and spaces in them...more than just letters. The last string doesn't have anything in it at all. We call that an **emptry string**.

##3.1 String Arithmetic
You can do arithmetic with strings just like with numbers! Okay, so maybe not exactly like with numbers, but kind of like with numbers!

You can use the plus sign '+' to concatenate two strings together:

```
puts 'I like ' + 'apple pie.'
will print out 'I like apple pie.'
```
So, you can add (concatenate) strings, but you can also multiply them:

```
puts 'blink ' * 4
blink blink blink blink
```
That's pretty cool.

##3.2 12 vs. '12'
There is a difference between **numbers** and **digits**. ```12``` is a number, but ```'12'``` is a string of two digits. If you aren't careful with how you mix your **strings** and **numbers** you might run into problems.

##Problems
There are some mixtures of **numbers** and **strings** that won't work (for fairly obvious reasons). 

```
puts '12' + 12
puts '2' * '5'
```
Will spit out:

```
exercises.rb:24:in `+': no implicit conversion of Fixnum into String (TypeError) from exercises.rb:24:in
```
Honestly, pretty interested in learning about what is communicated in the error messages in Ruby, so look that up when you have time (haha).

You get the error message because you can't add a number to a string or multiply a string by another string. 

Order also matters. That is, you could write ```'pig' * 5``` into a program and it would spit out  ```pigpigpigpigpig```, but if you wrote ```5*'pig'``` you'll get an error because that means 'pig' sets of the number 5, which makes no sense.

###The Escape Character (backslash)
What about the phrase:

```
puts 'You're swell!'
```
This phrase also throws an error. The problem is that your computer can't tell the difference between an apostrophe and a single quote, so it thinks you've ended the string after 'You'. You need a way to tell the computer that the apostrophe is and apostrophe and not a single quote. We do that with the **escape** character (which is the backslash):

```
puts 'You\'re swell!'
```
The backslash escapes itself and the apostrophe, as you can see in the exercises.rb document. So, the following lines produce the same output (```up/down```):

```
puts 'up\\down'
puts 'up\down'
```

#Chapter 4 - Variables and Assignments
You can store a string or number in your computer's memory for later use. To store the string in your computer's memory you need to give it a name. Programmers call this process **assignment** and they call the names **variables**. A variable name can usually be just about any sequence of letters and numbers.In Ruby, the first character of the name *needs to be a lowercase letter*. 

```
my_string = '...you can say that again...'
puts my_string
puts my_string
```
will print out:

```
...you can say that again...
...you can say that again...
```
Just as we can **assign** an object (in this case a string object) to a variable, we can **reassign** a different object to that variable.

```
composer = 'Mozart'
puts composer + ' was "da bomb" in his day.'

composer = 'Beethoven'
puts 'But I prefer ' + composer + ', personally.'
```
will output:

```
Mozart was "da bomb" in his day.
But I prefer Beethoven, personally.
```
**Variables** can point to any kind of **object**, not just strings. 

*Variables point to their values, not the other way around. So once you change what a variable is pointing to, other variables that were also pointing to the original value will NOT change with it.*

#Chapter 5 - Mixing it Up
We have seen a few different types of **objects**: integers, floats, and strings. We have also made **variables** that point to them. Now, let's bring them together.
One problem we have is that you can't add a string and a number together. So, the following does not work:

```
var1 = 2
var2 = '5'
puts var1 + var2
```
The problem is that your computer doesn't know if you want the output to be ```7``` (2 + 5) or ```25``` ('2' + '5').
Let's start with getting var1 to be a string instead of a number, so that the output would be 25.

##5.1 Conversions
To get the string version of an object, just write '.to_s' after it:

```
var1 = 2
var2 = '5'
puts var1.to_s + var2
```
Outputs: ```25```.
In the same vein, '.to_i' gives the integer value of an object, and '.to_f' gives the float version of an object. These **methods** *do NOT change* the value that the variable is pointing to. It just serves up a different version of that object.
There are some good examples in the exercise.rb file, but there are a few that were odd that are worth mentioning here:

```
puts '5 is my favorite number!'.to_i
puts 'Who asked you about 5 or whatever?'.to_i
puts 'Your momma did.'.to_f
```
Outputs the following:

```
5
0
0.0
```
The reason that it outputs anything is that ```.to_i``` ignores the first thing it doesn't understand (and the rest of the string from that point on). So, the first line was converted to 5, but the next two lines, since they began with letters, were ignored completely, so the computer just picks zero.

##5.2 Another look at puts
Here's a secret. The 's' in 'puts' really stands for *string*. 'puts' really stands for *'put string'*. So really anything you use 'puts' for will be output as a string. Ruby has many types of objects, and it is good to know that if you try to 'puts' a really weird object it will always output as a string.

##5.3 The gets method
Just as **puts** always spits out strings, **gets** only retrieves only strings. And where does it get them from?

Your keyboard!

```puts gets``` will just spit back out anything you type. Kind of cool.

##5.4 Did it work?
Yes! Congratulations on successfully using the command line to run these exercises. You are competent on day 2.5 of class.

##5.5 The chomp Method
Yay! ```gets``` allows you to make interactive programs!
Check out the exercise.rb file to see the result!

\*Note: if you press the ```Enter``` key while typing into a ```gets```, it will grab the ```Enter``` key! Fortunately, there's a **method** that deals with just this sort of issue: ```chomp```. You use chomp in the exercise.rb file.

##5.6 A few things to try
Check out exercises.rb for these. You did a good job, I think.

#Chapter 6 - More About Methods
We have seen 10 methods already. What are they?
1. puts
2. gets
3. to_i
4. to_s
5. to_f
6. chomp
7. +
8. -
9. *
10. /

"**methods** are things that do stuff."
If **objects**, like strings, integers, and floats are the nouns in the Ruby language, **methods** are the verbs. Just like in English, you need a noun (or object) that completes the verb.

###Arithmetic are methods too
You may not realize it, but when you type in:

```
puts('hello ' + 'world')
puts((10 * 9) + 9)
```
You are really typing in

```
puts('hello '.+ 'world')
puts((10.* 9).+ 9)
```
The dots (periods) denote the object and the method to be applied to the object, as in `object.method`. It is important to understand what's *really* happening when you use the arithmetic methods.

##6.1 Fancy String Methods
We're going to learn some helpful methods!

* **reverse** - returns a reversed version of a string object. `'hello world'.reverse = dlrow olleh`. It doesn't change the original object that you apply it to. It just makes a new backwards version of it.
* **length** - returns the number of characters in a string object. **length** returns an integer, so remember that you will need to convert to a string if you want to print the result.
* **upcase** - changes characters in an object to uppercase.
* **downcase** - changes characters in an object to lowercase.
* **swapcase** - switches the case of every letter in a string.
* **capitalize** - downcase, except makes the first letter uppercase (if it's a letter).
* **center** - makes text centered along some line width.
* **ljust** - left justifies object.
* **rjust** - right justifies object.

##6.2 A few things to try
I completed a few exercises in the homework programs folder for chapter 6 including the *Angry Boss* and the *Table of Contents* exercises.

##6.4 More Arithmetic
There are two more arithemtic methods: `**` and `%`. 
####Exponents
The double-splat `**` is used for writing exponents. You can use floats for your exponents, so to find the square root of `5` you would write `5**0.5`. To find the square of `5` you would write `5**2`.
####Modulus
The modulus method gives you the remainder after division by a number. So, `7%3` would give you `1`.
####Absolute Value
To find the absolute value of a number, use the `.abs` method.

##6.5 Random Number
The method to get a randomly chosen number is **rand**. If you call **rand** just on its own, you'll get a float greater than or equal to 0.0 and less than 1.0. If you give it an integer parameter (by calling rand(5), for example), it will give you an integer greater than or equal to 0 and less than 5 (so five possible numbers, from 0 to 4).

###*Seed* Rand
Sometimes you want a random number generator to return the *same* random numbers in the same sequance on two different runs of your program. That is what **srand** does. It will do the same thing every time you seed it with the same number. If you want to get different numbers again, then just call srand, passing in no parameter. This might seed it with a really weird number, using (among other things) the current time on your computer down to the millisecond.

##6.6 The Math Object
\* Sidenote!
In Ruby, variables start with a lowercase letter. **Constants** begin with an uppercase letter. The Math Object is a Constant. Ruby will get annoyed with you if you try to change a constant. There are many constants within the Math Object:
* Math::PI
* Math::E
* Math.cos
* Math.tan
* Math.log
* Math.sqrt

You may be wondering what the `::` notation does. Well, it is called a **scope operator** and it is beyond the scope of this ebook! But you can use Math::PI like any other vairable. `Math` has all the features you would expect a decent calculator to have. And the floats are *really* close to being the right answers but not exact. Do not trust them further than you can calculate them.

#Chapter 7 - Flow Control
We are going to breathe life into our programs in this chapter.
##7.1 Comparison Methods
You can compare two numbers using usual "greater than" or "less than" statements:

```
puts 1 > 2
puts 1 < 2
false
true
```
Similarly, you can use normal "greater than or equal to" style comparisons:

```
puts 5 >= 5
puts 5 <= 4
true
false
```
Finally, you can check if two objects are equal using `==` and `!=` to check if things are 'equal' or 'different' respectively.
###Lexicographical Ordering
You can compare two strings, but Ruby will compare their **lexicographical ordering**, which basically means the order that they would appear in the dictionary (alphabetically).

```
puts 'cat' < 'dog'
true
```
There is a catch though. The way computers do things, they order capital letters as coming before lowercase letters. So 'Xander' would come before 'bug lady'. So if you want to figure out which word would actually ome first make sure you upcase or downcase your strings before comparing them.

##7.2 Branching
**Branching** is a simple and powerful concept in programming.

```
puts 'Hello, what\'s your name?'
name = gets.cchomp
puts 'Hello, ' + name + '.'

if name == 'Chris'
  puts 'What a lovely name!'
end
```

That is how branching works. If what comes after the **if** is *true*, we run the code between the **if** and the **end**. IF what comes after the **if** is *false*, we don't.
Good indentation of your branching is crucial to having readable code. Have your `if` and your `end` line up vertically, and have everything between them indented. Use an indentation of two spaces in Ruby.

Branching is kind of like a fork in the code. Branches can have their own branches, as you can see in the exercises for this chapter. He strongly suggest writing your `if`, `else`, `elsif`, and `end` statements all at the same time, because then he can focus on filling in the code for each conditional. Even though the program isn't filled in, it will still run successfully. 

##7.3 Looping
Often, you'll want your computer to do the same thing over and over again. You can tell your computer to do a task over and over using a few different techniques.

###while loop
**while** tells your computer to repeat certain parts of a program while a condition is true. **while** is not a fabulous program though. For one thing, **while** tests your condition at the top of the loop. 

```
input = ''

while input != 'bye'
  puts input
  input = gets.chomp
end

puts 'Come again soon!'
```

To get a while loop to loop forever, you just have to give it a condition that is always true. Ruby has a way to break out of **while loops**.

```
\# This is so totally a real program!
while 'Spike' > 'Angel'
  input = gets.chomp
  puts input
  if input == 'bye'
  	break
  end
end

puts 'Come again soon!'

