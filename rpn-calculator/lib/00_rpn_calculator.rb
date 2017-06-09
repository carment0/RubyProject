class RPNCalculator
  # TODO: your code goes here!
  def initialize
    @stack = []
  end

  def evaluate(str)
    arr = str.split(' ')
    arr.each do |x|
      if x.to_i.to_s == x
        push(x)
      elsif x == '+'
        plus
      elsif x == '-'
        minus
      elsif x == '*'
        times
      elsif x == '/'
        divide
      end
    end
    value
  end

  def tokens(str)
    conversion = []
    arr = str.split(' ')
    arr.each do |x|
      if x.to_i.to_s == x
        conversion << x.to_i
      elsif x == '+'
        conversion << :+
      elsif x == '-'
        conversion << :-
      elsif x == '*'
        conversion << :*
      elsif x == '/'
        conversion << :/
      end
    end
    conversion
  end

  def push(num)
    @stack << num.to_f
  end

  def plus
    self.check_error
    result = @stack.pop + @stack.pop
    @stack << result
  end

  def minus
    self.check_error
    subtractor = @stack.pop
    result = @stack.pop - subtractor
    @stack << result
  end

  def times
    self.check_error
    result = @stack.pop * @stack.pop
    @stack << result
  end

  def divide
    self.check_error
    divisor = @stack.pop
    result = @stack.pop / divisor
    @stack << result
  end

  def value
    @stack.last
  end

  def check_error
    if @stack.length < 2
      raise 'calculator is empty'
    end
  end


end
