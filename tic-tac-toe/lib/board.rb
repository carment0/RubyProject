# * In your `Board` class, you should have a grid instance variable to keep track
#   of the board tiles. You should also have the following methods:
#   - `place_mark`, which takes a position such as `[0, 0]` and a mark such as :X
#     as arguments. It should throw an error if the position isn't empty.
#   - `empty?`, which takes a position as an argument
#   - `winner`, which should return a mark
#   - `over?`, which should return true or false
#   - If you want to be a little fancy, read the attached `bracket-methods`
#     reading.
#
# * In your player classes, have an instance variable `mark` that the game will
#   set on initialize.

class Board
  attr_accessor :grid

  def initialize(grid = Array.new(3) {Array.new(3)})
    @grid = grid
  end

  def empty?(position)
    grid[position[0]][position[1]] == nil
  end

  def place_mark(position, mark)
    if empty?(position)
      grid[position[0]][position[1]] = mark
    end
  end

  def get_copy
    new_grid = Array.new(3) {Array.new(3)}
    (0..2).each do |row|
      (0..2).each do |col|
        new_grid[row][col] = @grid[row][col]
      end
    end
    return Board.new(new_grid)
  end

  def winner
    [rows, column, diagonals].each do |diff_wins|
      diff_wins.each do |row|
        return :X if row == [:X, :X, :X]
        return :O if row == [:O, :O, :O]
      end
    end
    nil
  end

  def over?
    won? || tied?
  end

  def available_moves
    result = []
    (0..2).each do |row|
      (0..2).each do |col|
        if @grid[row][col] == nil
          result << [row, col]
        end
      end
    end
    result
  end

  private

  def rows
    grid
  end

  def column
    grid.transpose
  end

  def diagonals
    down_diag = [[0,0], [1,1], [2,2]]
    up_diag = [[0,2], [1,1], [2,0]]
    rows = [down_diag, up_diag].map do |diag|
      diag.map do |x, y|
        grid[x][y]
      end
    end
    rows
  end

  def won?
    winner != nil
  end

  def tied?
    return false if won?
    grid.all? { |row| row.none? { |el| el.nil? }}
  end
end
