# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  uppercase_letters = ''
  ('A'..'Z').each do |ch|
    if str.include?(ch)
      uppercase_letters << ch
    end
  end
  uppercase_letters
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  half_length = str.length / 2
  if str.length.even?
    return str[(half_length - 1)..half_length]
  else
    return str[half_length]
  end
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  vowel_count = 0
  str.each_char do |ch|
    if VOWELS.include?(ch)
      vowel_count += 1
    end
  end
  vowel_count
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  sum_of_factoral = (1..num).to_a
  factorial = nil
  sum_of_factoral.each do |el|
    if factorial.nil?
      factorial = el
    else
      factorial = factorial * el
    end
  end
  factorial
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  str = ''
  arr.each_index do |idx|
    if str.length < arr.length
      str << arr[idx] + separator
    else
      str << arr[idx]
    end
  end
  str
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  new_str = ''
  arr = str.split('')
  arr.each_with_index do |el, idx|
    if idx.odd?
      new_str << el.upcase
    else
      new_str << el.downcase
    end
  end
  new_str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  new_str = []
  arr = str.split
  arr.each_with_index do |el, idx|
    word = ''
    if el.length >= 5
      word << el.reverse
    else
      word << el
    end
    new_str << word
  end
  new_str.join(' ')
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  arr = []
  (1..n).each do |number|
    if number % 3 == 0 && number % 5 == 0
      arr << 'fizzbuzz'
    elsif number % 3 == 0
      arr << 'fizz'
    elsif number % 5 == 0
      arr << 'buzz'
    else
      arr << number
    end
  end
  arr
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  arr.reverse
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  factors = []
  (1..num).each do |n|
    if num % n == 0
      factors << n
    end
  end
  factors.length == 2
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  factors = []
  (1..num).each do |n|
    if num % n == 0
      factors << n
    end
  end
  factors.sort
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  sorted_factors = factors(num)
  sorted_primes = []
  sorted_factors.each do |el|
    if prime?(el)
      sorted_primes << el
    end
  end
  sorted_primes
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  even_num = []
  odd_num = []
  arr.each_with_index do |el, idx|
    if el.odd?
      odd_num << el
    else
      even_num << el
    end
  end

  if even_num.length == 1
    return even_num[0]
  else
    return odd_num[0]
  end
end
