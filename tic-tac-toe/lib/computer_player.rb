# * In your `ComputerPlayer` class,
#   - `display` should store the board it's passed as an instance variable, so
#     that `get_move` has access to it
#   - `get_move` should return a winning move if one is available, and otherwise
#     move randomly.
class ComputerPlayer
  attr_reader :name, :board
  attr_writer :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    @board.available_moves.each do |pos|
      board_copy = @board.get_copy
      board_copy.place_mark(pos, @mark)
      return pos if board_copy.winner
    end
    @board.available_moves.sample
  end
end
