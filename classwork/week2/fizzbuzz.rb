#Get a number from the user
#If the number is divisible by three, print "fizz"
#If the number is divisible by five, print "buzz"
#If the number is divisible by three and five, print "fizzbuzz"

puts "FIZZ BUZZ!"
puts "Enter a number, if you dare:"
numberString = gets.chomp
number = numberString.to_i

if numberString.class == String
  puts "That's not a number. That's a string."
elsif number % 3 == 0 && number % 5 == 0
  puts "fizzbuzz"
elsif number % 3 == 0
  puts "fizz"
elsif number % 5 == 0
  puts "buzz"
else
  puts number
end

puts "Congratulations on your first FizzBuzz experience. We hope you enjoyed your stay."