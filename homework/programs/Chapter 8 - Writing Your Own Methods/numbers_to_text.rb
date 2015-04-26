# Take a number input and output the text version.

# Make sure the number is between 0 and 100, inclusive.
def number_checker guessed_number
  if guessed_number < 0 or guessed_number > 100
    return false
  else
    return true
  end
end

numbers = [0,1,2,3,4,5,6,7,8,9]

single = ['zero','one','two','three','four','five','six','seven','eight','nine']

teens = ['eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']

double = ['ten', 'twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']

puts 'Input a number between 0 and 100:'
number = gets.chomp.to_i
number_ten = number/10

if number_ten == 0
  puts "zero"
elsif number_ten < 1
  puts "between 0 and 9"
elsif number_ten > 1
  puts "between 10 and 100"
end

  
