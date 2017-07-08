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
