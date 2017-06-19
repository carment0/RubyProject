class HumanPlayer
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def get_move
    puts "Where would you like to place your mark? (row, col)"
    move = gets.chomp.split(",")
    move.map {|el| el.to_i}
  end

  def display(board)
    print board.grid
  end
end
