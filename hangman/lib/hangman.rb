require_relative 'computer_player'
require_relative 'human_player'

class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @board = []
  end

  def setup
    length = @referee.pick_secret_word
    @guesser.register_secret_length(length)
    @board = Array.new(length)
  end

  def take_turn
    letter_guess = @guesser.guess(board)
    induces = @referee.check_guess(letter_guess)
    update_board(induces, letter_guess)
    @guesser.handle_response
  end


  private

  def update_board(induces, letter_guess)
    induces.each do |idx|
      @board[idx] = letter_guess
    end
  end
end

class HumanPlayer
end

class ComputerPlayer
  def initialize(dictionary)
    @dictionary = dictionary
    @alphabet = alphabet_hash
  end

  def alphabet_hash
    alphabet_hash = {}
    @dictionary.each do |word|
      word.each_char do |ch|
        if alphabet_hash[ch]
          alphabet_hash[ch] += 1
        else
          alphabet_hash[ch] = 1
        end
      end
    end
    alphabet_hash
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word.length
  end

  def check_guess(letter)
    indices = []
    @secret_word.split('').each_with_index do |ch, idx|
      if ch == letter
        indices << idx
      end
    end
    indices
  end

  def register_secret_length(length)
    @dictionary.select! {|word| word.length == length}
  end

  def guess(board)
    board.each do |char|
        @alphabet.delete(char) unless char.nil?
    end
    count_arr = @alphabet.sort_by {|k, v| v}.reverse
    best_letter = count_arr[0][0]
    best_letter
  end

  def handle_response(letter, index_of_letter)
    @dictionary.select! do |word|
      word_indices = []
      word.chars.each_with_index do |ch, idx|
        word_indices << idx if ch == letter
      end
      index_of_letter == word_indices
    end
  end

  def candidate_words
    @dictionary
  end
end
