def translate(sentence)
  result = []
  arr_words = sentence.split
  arr_words.each do |word|
    if word.include?("sch") || word.include?("qu")
      if word == word.capitalize
        result << phoneme(word).capitalize
      else
        result << phoneme(word)
      end
    else
      if word == word.capitalize
        result << latinize(word).capitalize
      else
        result << latinize(word)
      end
    end
  end
  result.join(' ')
end

def latinize(word)
  vowels = "aeiou"
  until vowels.include?(word[0])
    word = word[1..-1] + word[0]
  end
  word + "ay"
end

def phoneme(word)
  if word.include?("sch")
    idx = word.index("sch")
    new_word = word[idx+3..-1] + word[0..idx+2]
  elsif word.include?("qu")
    idx = word.index("qu")
    new_word = word[idx+2..-1] + word[0..idx+1]
  end
  new_word + "ay"
end
