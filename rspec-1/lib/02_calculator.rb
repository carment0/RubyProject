def add(n1, n2)
  n1 + n2
end

def subtract(n1, n2)
  n1 - n2
end

def sum(arr)
  arr.reduce(0, :+)
end

def multiply(arr)
  arr.reduce(:*)
end

def power(n1, power)
  n1**power
end

def factorial(num)
  if num == 0 || num == 1
    return 1
  end

  products = []
  (1..num).each do |n|
    products << n
  end

  products.reduce(:*)
end
