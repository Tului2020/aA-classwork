def count_down(num)
  if num == 0
    p "Houston, we have lift-off!"
  else
    p num
    count_down(num - 1)
  end
end


def factorial(num)
  return 1 if num <= 1
  num * factorial(num - 1)
end

def fib(n)
  return 1 if n == 1 || n == 2
  fib(n - 1) + fib(n - 2)
end

p fib(4)

# fib(4) ==> fib(3) + fib(2)
# fib(3) ==> fib(2) + fib(1) = 1 + 1 = 2
# fib(2) ==> 1
# fib(4) = 2 + 1 = 3