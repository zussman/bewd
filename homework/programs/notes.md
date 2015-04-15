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
