#Array Methods
This document is a guide for learning array methods that you will find useful in Ruby.

##The .each method
**each** allows us to do something (whatever we want) to ```each``` object the array poitns to. For example:

```
languages = ['English', 'Hebrew', 'Ruby']

languages.each do |lang|
  puts 'I love ' + lang + '!'
  puts 'Don\'t you?'
end

puts 'And let\'s hear it for C++!'
puts '...'
```
This example basically says, "For ```each``` object in the array named ```languages```, point the variable ```lang``` to the object and then ```do``` everything the program tells the computer to until the computer comes to the end."

---
##Important note on loops vs. methods
The ``each`` method may seem similar to true loops like `while`, `end`, `do`, `if`, and `else`, but it is not. Those loops are ***not*** methods. They are a fundamental part of the Ruby language, just like `=` and `()`, kind of like punctuation marks in English. Methods like `each` are just methods. When methods act like loops they are called ***iterators***.

Another important iterator is the integer method `.times`:

---

##The times method
