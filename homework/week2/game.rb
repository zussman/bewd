secret_number = rand(1..10)
puts "Guess the secret number:"
guessed_number = gets.chomp.to_i
guesses = 3

if guesses > 0
  if guessed_number == secret_number
    puts "You guessed correctly on the " + guesses.to_s + " guess."
  elsif guessed_number > secret_number
    puts "You guessed too high!. Guess again:"
    guesses = guesses - 1
  elsif guessed_number < secret_number
    puts "You guessed too low! Guess again:"
    guesses = guesses - 1
  end
elsif guesses == 0
  puts "You ran out of guesses! GAME OVER"
end
