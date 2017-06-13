def echo(string)
  "#{string}"
end

def shout(string)
  "#{string.upcase}"
end

def repeat(string, number=2)
  ([string] * number).join(' ')
end

def start_of_word(str, number)
  str[0..number-1]
end

def first_word(str)
  arr = str.split(' ')
  arr[0]
end

def titleize(str)
  arr = str.capitalize.split(' ')
  new_arr = []
  words_no_cap = ["and", "or", "the", "over", "to", "the", "a", "but"]
  arr.each_with_index do |word, idx|
    if words_no_cap.include?(word)
      new_arr << word
    else
      new_arr << word.capitalize
    end
  end
  new_arr.join(' ')
end
