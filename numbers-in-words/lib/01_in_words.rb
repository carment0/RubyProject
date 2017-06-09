class Fixnum
  def in_words
    num_map = {
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      10 => 'ten',
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen',
      20 => 'twenty',
      30 => 'thirty',
      40 => 'forty',
      50 => 'fifty',
      60 => 'sixty',
      70 => 'seventy',
      80 => 'eighty',
      90 => 'ninety',
      100 => 'hundred'
    }


    scale_map = {
      1_000_000_000_000 => 'trillion',
      1_000_000_000 => 'billion',
      1_000_000 => 'million',
      1_000 => 'thousand'
    }

    return 'zero' if self == 0
    str = []
    if self < 1000
      num = self
      if num > 99
        prefix = num / 100
        str << "#{num_map[prefix]} hundred"
        num = num % 100
      end

      if num > 19 && num < 100
        prefix = (num / 10) * 10
        str << "#{num_map[prefix]}"
        num = num % 10
      end

      if num < 20
        str << "#{num_map[num]}" unless num == 0
      end
    else
      num = self
      scale_map.keys.each do |key|
        prefix = num / key
        str <<  "#{prefix.in_words} #{scale_map[key]}" if prefix > 0
        num = num % key
      end
      str << num.in_words unless num == 0
    end
    str.join(' ')
  end
end


=begin
num = 200100
200100/1_000_000_000_000 = 0
200100/1_000_000_000 = 0
200100/1_000_000 = 0
200100/1_000 = 200
prefix = 200
str = [thousand]
num = 200100/1_000
num = 100

=end
p 234176.in_words
