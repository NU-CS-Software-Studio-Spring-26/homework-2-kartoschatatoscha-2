# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  arr.reduce(0) { |acc, elem| elem + acc }
end

def max_2_sum arr
  if arr.length == 0
    return 0
  end
  if arr.length == 1
    return arr[0]
  end
  acc = arr[0] + arr[1]
  min = [arr[0], arr[1]].min
  max = [arr[0], arr[1]].max
  arr[2..-1].each do |elem|
    if elem > min
      acc = acc - min
      acc = acc + elem
      min = elem
    end
    if max < min
      tmp = min
      min = max
      max = tmp
    end
  end
  return acc
end

def sum_to_n? arr, n
  if arr.length <= 1
    return false
  end
  (0..(arr.length-1)).each do |i|
    ((i+1)..(arr.length-1)).each do |j|
      if arr[i]+arr[j]==n
        return true
      end
    end
  end
  return false
end

# Part 2

def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant? s
  if s.length == 0
    return false
  end
  allow = (('a'..'z').to_a + ('A'..'Z').to_a).select{|elem| ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'].include?(elem) == false}
  allow.include?(s[0])
end

def binary_multiple_of_4? s
  (0..(s.length-1)).each do |i|
    c = s[i]
    if ['0', '1'].include?(c) == false
      return false
    end
  end
  if s.length == 0
    return false
  end
  num = s.to_i
  if num%100 == 0
    return true
  end
  false
end

# Part 3

class BookInStock
  
  def initialize(isbn, price)
    if isbn.length == 0
      raise ArgumentError
    end
    if price <= 0.0
      raise ArgumentError
    end
    @isbn = isbn
    @price = price
  end

  attr_accessor :isbn
  attr_accessor :price

  def price_as_string()
    "$"+sprintf('%.2f', @price)
  end
end
