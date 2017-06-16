# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  answer = rand(1..100)
  number_of_guess = 0
  user_input = nil
  until user_input == answer
    puts "Guess a number"
    user_input = gets.chomp.to_i
    if user_input > answer
      puts "#{user_input} is too high"
    elsif user_input < answer
      puts "#{user_input} is too low"
    else
      puts "#{user_input} is correct"
    end
    number_of_guess += 1
  end
  puts "Number of guesses: #{number_of_guess}"
end
