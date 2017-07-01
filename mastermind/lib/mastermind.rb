class Code
  attr_reader :pegs

  PEGS = {
    "B" => :blue,
    "G" => :green,
    "O" => :orange,
    "P" => :purple,
    "R" => :red,
    "Y" => :yellow
  }


  def self.parse(code_string)
    code = code_string.upcase
    pegs = []

    code.each_char do |ch|
      if !PEGS.keys.include?(ch)
        raise "Please pick valid peg colors"
      end
      pegs << PEGS[ch]
    end

    self.new(pegs)
  end

  def self.random
    random_code = 4.times.map {|c| PEGS.keys.sample}
    self.new(random_code)
  end

  def initialize(pegs)
    @pegs = pegs
  end

  def [](index)
    @pegs[index]
  end

  def exact_matches(guess_code)
    exact_count = 0
    @pegs.each_index do |idx|
      exact_count += 1 if @pegs[idx] == guess_code[idx]
    end
    exact_count
  end

  def near_matches(guess_code)
    matches = 0
    PEGS.values.each do |color|
      matches += [@pegs.count(color), guess_code.pegs.count(color)].min
    end
    matches - exact_matches(guess_code)
  end

  def ==(guess_code)
    return false if guess_code.class != Code
    @pegs == guess_code.pegs
  end

  #print string
  def to_s
    "[#{@pegs.join(", ")}]"
  end
end

class Game
  attr_reader :secret_code

  def initialize(code=Code.random)
    @secret_code = code
  end

  def play
    turn = 10
    while turn > 0
      get_guess
      unless @user_guess.nil?
        puts "(You have #{turn-1} more turns left)"
        display_matches(@user_guess)
        turn -= 1
      end
      break if won?
    end
    win?
  end

  def won?
    @secret_code == @user_guess
  end

  def get_guess
    puts "\nGuess the secret color code!"
    puts "\t Select four colors: B, G, O, P, R, or Y"
    puts "\t Same color can be used more than once."
    puts "\t You have 10 chances to guess the code correctly."
    guess_code = $stdin.gets.chomp
    begin
      @user_guess = Code.parse(guess_code)
    rescue RuntimeError
      puts "Color does not exist, please try again"
      @user_guess = nil
    end
  end

  def display_matches(code)
    puts "\n>> exact matches: #{@secret_code.exact_matches(code)}"
    puts ">> near matches: #{@secret_code.near_matches(code)}"
    puts "_______________________________________________________"
  end

  def win?
    if @secret_code == @user_guess
      puts "You Wonnnn! The answer was #{@secret_code}"
    else
      puts "You Lost! The answer was #{@secret_code}"
    end
  end
end


if $PROGRAM_NAME == __FILE__
  game = Game.new(Code.parse("brbr"))
  game.play
end
