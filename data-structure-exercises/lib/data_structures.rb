# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  # your code goes here
  sorted_arr = arr.sort
  sorted_arr.last - sorted_arr.first
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  # your code goes here
  arr.sort == arr
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  # your code goes here
  vowel_count = 0
  vowels = 'aeiou'
  str.downcase.each_char do |ch|
    if vowels.include?(ch)
      vowel_count += 1
    end
  end
  vowel_count
end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  # your code goes here
  no_vowel_str = ''
  vowels = 'aeiou'
  str.downcase.each_char do |ch|
    if !vowels.include?(ch)
      no_vowel_str << ch
    end
  end
  no_vowel_str
end


# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  # your code goes here
  num_str_arr = int.to_s.split('')
  num_str_arr.sort.reverse
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
  # your code goes here
  str.each_char do |ch|
    if str.downcase.count(ch) > 1
      return true
    end
  end
  false
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  # your code goes here
  a = arr[0..2].join.to_i
  b = arr[3..5].join.to_i
  c = arr[6..9].join.to_i
  "(#{a}) #{b}-#{c}"
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  # your code goes here
  arr = str.split(',')
  sorted_num = arr.sort
  sorted_num.last.to_i - sorted_num.first.to_i
end


#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  # your code goes here
  shift = offset % arr.length
  arr.drop(shift) + arr.take(shift)
end
