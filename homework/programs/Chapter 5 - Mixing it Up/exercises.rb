#Chapter 5 - Mixing it Up
#5.1 Conversions

puts '15'.to_f
puts '99.999'.to_f
puts '99.999'.to_i
puts ''
puts '5 is my favorite number!'.to_i
puts 'Who asked you about 5 or whatever?'.to_i
puts 'Your momma did.'.to_f
puts ''
puts 'stringy'.to_s
puts 3.to_i

#5.3 The gets method
puts gets

#5.5 The chomp Method
#Without the chomp method
puts 'Hello there, and what\'s your name?'
name = gets
puts 'Your name is ' + name + '? What a lovely name!'
puts 'Pleased to meet you, ' + name + '. :)'

#with the chomp method
puts 'Hello there, and what\'s your name?'
name = gets.chomp
puts 'Your name is ' + name + '? What a lovely name!'
puts 'Pleased to meet you, ' + name + '. :)'

#5.6 A few things to try (exercises)
#Write a program that asks for a person's first name, then middle, then last. Finally, it should greet the person using their full name
puts '.'
puts '.'
puts '.'
puts '.'
puts '.'
puts '.'
puts 'You meet a strange little creature in the swamps of Dagobah...'
puts 'The creature asks you, "What first name have you?"'
first_name = gets.chomp
puts 'The creature considers, "Mmm...' + first_name + '. Good first name you have."'
puts '"Middle name you must also have. What is your middle name?"'
middle_name = gets.chomp
puts '"Good. Good. My middle name is \'Danger\'. But ' + middle_name + ' is good too.'
puts '"Your last name. What is it?"'
last_name = gets.chomp
full_name = first_name + ' ' + middle_name + ' ' + last_name
puts '"Yes. Yeeees. The force is strong with you, ' + full_name + '."' 
puts '.'
puts '.'
puts '.'
puts '.'
puts '.'
puts '.'

# Write a program that asks for a person's favorite number. Have your program add 1 to the number, and then suggest the result as a bigger and better favorite number.
puts '"Hello there good stranger. Dost thou have a favorite number?"'
favorite_number = gets.chomp.to_i
new_number = favorite_number + 1
puts '"Oh, jolly good. ' + favorite_number.to_s + ' is an excellent choice."'
puts '"But might I interest you in a slightly larger number? Perhaps something more accomodating? How about ' + new_number.to_s + '?"'