###############################################################################
##
## Back-End Web Development - Homework #1
##
## Secret Number is a game you will build in two parts.
## The purpose of the game is to have players guess a secret number from 1-10.
##
## Read the instructions below.
## This exercise will test your knowledge of Variables and Conditionals.
##
################################################################################
##
## We're ready to program! To practice our Ruby skills lets create a secret number game.
## In this game players have three tries to guess a secret number between 1 and 10.
##
## Here are some guidelines to building your game:
##
##  Intros
##  - Welcome the player to your game. Let them know who created the game.
##    - Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"
##    - Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10
##    and that they only have 3 tries to do so.
##
##  Functionality:
##   -  Hard code the secret number. Make it a random number between 1 and 10.
##   -  Ask the user for their guess.
##   -  Verify if they were correct. If the player guesses correctly they win the game they should be congratulated and the game should end.
##   -  If they guess incorrectly, give the player some direction. If they guess too high let them know, if they guess too low, let them know.
##   -  Don't forget to let your players know how many guesses they have left. Your game should say something like
##      "You have X many guesses before the game is over enter a another number"
##   -  If they don't guess correctly after 3 tries, print that the Player lost and the game is over. Also let them know what the `secret_number` was.
##
## Make sure to add helpful comments to your code to document what each section does.
##
## Remember to cast input from the Player into the appropriate data type.
##
################################################################################

#Welcome the contestants to the game
puts "
•                            •
••                          ••
•••                        •••
••••  SECRET NUMBER GAME  ••••
•••                        •••
••                          ••
•                            •"

puts '"Welcome to the Secret Number Game!"'
puts "[scattered applause...]"

#Ask the contestant their name.
puts '"All right, contestant. Let\'s start off with an introduction. What is your name?"'

# Store the response in a variable called 'player_name'
player_name = gets.chomp
puts '"Hi ' + player_name + '!"'

# Explain the rules of the game
puts '"Okay, well now that we all know our contestant ' + player_name + ', let\'s go over the rules of the game:"'
puts '"In this game players have three tries to guess a secret number between 1 and 10."'
puts '"The catch: you will only have three tries to guess the correct number!"'

# Create the secret number
secret_number = rand(1..10)
secret_number = secret_number.to_i
puts "[secret number is #{secret_number}.]"

# Get the contestant's first guess.
guesses = 0
puts '"So, ' + player_name + ', what is your first guess?"'
def get_guess
  number_guess = gets.chomp
  number_guess = number_guess.to_i
  return number_guess
end
number_guess = get_guess

# You need to have a variable that keeps track of how many guesses have been made.
  # However, you can't just add 1 to the number of guesses until they are three or more.
  # You should only add if the guess is an integer between 1 and 10.
# You also need a number checker for each guess. The checker should run after every guess before 
  # If the number is good, the number checker function should return true. Otherwise it should return false.
    # If the number is good, then it should add a guess

# Check the Number. If it's a number between 1 and 10, run the number_guesser function on it.
def number_checker guessed_number

  # You will need a regular expression.
  if guessed_number <= 0 or guessed_number > 10
    puts "Sorry, please guess an integer number between 1 and 10, inclusive."
    return false
  else
    return true
  end
end

# Higher, Lower, or Equal
def compare guess, secret_number
  # Check if guessed number is higher, lower, or equal to the secret number.
  if number_checker(guess) == true
    if guess == secret_number.to_i
      puts 'You guessed ' + guess + '. You guessed correctly on the # try!'
    elsif guess > secret_number
      puts 'Your # guess is too high. Try again!'
    elsif guess < secret_number
      puts 'Your # guess is too low. Try again!;'
    end
  else
    # gets.chomp a new guess
  end
end

# Change language to first, second, third.
def guess_lang guess
  if guess == 0
    return 'first'
  elsif guess == 1
    return 'second'
  elsif guess = 2
    return 'third'
  else
    return false
  end
end

#

compare(number_guess, secret_number)

