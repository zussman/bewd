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
