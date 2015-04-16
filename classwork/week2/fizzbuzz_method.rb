#Get a number from the user
#If the number is divisible by three, print "fizz"
#If the number is divisible by five, print "buzz"
#If the number is divisible by three and five, print "fizzbuzz"

puts "FIZZ BUZZ!"
puts "Enter a number, if you dare:"
number = gets.chomp.to_i

def fizzbuzz(integer)
  if integer % 3 == 0 && integer % 5 == 0
    puts "fizzbuzz"
  elsif integer % 3 == 0
    puts "fizz"
  elsif integer % 5 == 0
    puts "buzz"
  else
    puts integer
  end
  puts "Congratulations on your first FizzBuzz experience. We hope you enjoyed your stay."
end

fizzbuzz(number)