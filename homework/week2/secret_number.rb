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
puts '"Welcome to the Secret Number Game!"'
puts "[scattered applause...]"
puts '"I\'m your host, Sarah Silverman."'

#Ask the contestant their name.
puts '"All right, contestant. Let\'s start off with an introduction. What is your name?"'

# Store the response in a variable called 'player_name'
player_name = gets.chomp
puts '"Hi #{player_name}!"'

# Explain the rules of the game
puts '"Okay, well now that we all know our contestant #{player_name}, let\'s go over the rules of the game."'
puts '"In this game players have three tries to guess a secret number between 1 and 10."'
puts '"The catch: you will only have three tries to guess the correct number!"'

# Create the secret number
secret_number = rand(1..10)
puts "[secret number is #{secret_number}.]"

# Get the contestant's first guess.
puts '"So, #{player_name}, what is your first guess?"'
first_guess = gets.chomp

# Check the Number. If it's a number between 1 and 10, run the number_guesser function on it.
def number_checker(guess, number)
  # Make sure the guess isn't a string, 0, negative, or larger than 10.
  guess = guess.to_i
  if guess <= 0 or guess > 10
    puts "Sorry, please guess a number between 1 and 10."
  else
    puts "Now we'll do the number_guesser function"
    #number_guesser(guess, number)
  end
end

number_checker(first_guess, secret_number)

