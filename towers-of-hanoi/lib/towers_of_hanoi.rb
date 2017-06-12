# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi
  attr_reader :towers

  def initialize
    @towers = [[3, 2, 1],[],[]]
  end

  def play
    until won?
      puts "What tower do you want to move the disk from? 0, 1 or 2"
      player_move_from = gets.chomp.to_i
      if player_move_from > 2
        puts "Invalid input"
        next
      end
      puts "What tower do you want to place the disk? 0, 1 or 2"
      player_move_to = gets.chomp.to_i
      if player_move_to > 2
        puts "Invalid input"
        next
      end
      if valid_move?(player_move_from, player_move_to)
        move(player_move_from, player_move_to)
        render
      else
        puts "Not an valid move. Try again."
      end
    end
    puts "YAYY! YOU WON!! :)"
  end

  def render
    p @towers
  end

  def won?
    return true if @towers[1] == [3, 2, 1] || @towers[2] == [3, 2, 1]
  end

  def valid_move?(from_tower, to_tower)
    return false if @towers[from_tower].empty?
    return true if @towers[to_tower].last.nil?
    @towers[from_tower].last < @towers[to_tower].last
  end

  def move(from_tower, to_tower)
    disk = @towers[from_tower].pop
    @towers[to_tower].push(disk)
  end
end
