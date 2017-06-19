require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :board
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
    @board = Board.new
  end

  def current_player
    @current_player
  end

  def switch_players!
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def play_turn
    move = current_player.get_move
    mark = current_player.mark
    @board.place_mark(move, mark)
    switch_players!
  end
end
