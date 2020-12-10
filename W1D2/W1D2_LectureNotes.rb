# byebug intro
=begin
require "byebug"

def avg(a, b)
  sum = a + b
  sum / 2.0
end

debugger
first_result = avg(15, 20)
second_result = first_result + 0.5

p second_result
=end
# more byebug
=begin
require "byebug"
def is_prime?(number)
  (2...number).each do |factor|
    return false if number % factor == 0
  end

  true
end

def first_n_primes(num_primes)
  primes = []
  num = 2

  #debugger
  while primes.length < num_primes
    primes << num if is_prime?(num)
    num += 1
  end

  primes
end

p first_n_primes(5)
=end
# Errors
=begin
# SyntaxError; bad syntax
# NameError; my_name =
# NoMethodError; my_name('Tului'); callling method without declaring
# ArgumentError; invalid number of inputs
# TypeError; 5 + "dog``"
def check_num(num)
  if num > 0
    p 'positive'
  elsif num < 0
    p 'negative'
  else
    p 'zero'
  end
end

check_num(42)
=end
# Procs
=begin
#array = [1, 2, 3]
#p array.map {|num| num * 2}

# my_proc = proc { |num| num * 2 }
# p my_proc.call(1)

# my_proc = proc { |a, b| a + b }
# p my_proc.call(3, 2)


# def add_and_proc(num1, num2, prc)
#   sum = num1 + num2
#   prc.call(sum)
# end
#
# doubler = proc { |n| n * 2 }
# p add_and_proc(2, 3, doubler)
#
# negate = proc { |n| -1 * n }
# p add_and_proc(2, 3, negate)


# def add_and_proc(num1, num2, &prc)
#   sum = num1 + num2
#   prc.call(sum)
# end
#
# negate = proc { |n| -1 * n }
# p add_and_proc(2, 3) { |n| 2 * n }
# p add_and_proc(2, 3, &negate)
# # &arg converts proc into block

p [1, 2, 3].map { |num| num * 2 }

def my_map(arr, &prc)
  p arr
  p prc

  new_array = []
  arr.each { |ele| new_array << prc.call(ele) }

  new_array
end

p my_map([1, 2, 3]) { |num| num * 2 }
=end

