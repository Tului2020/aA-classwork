require 'byebug'
# def foo(x)
#   result = case
#     when x == 1 
#       "one"
#     when x == 2 then "two"
#     else "many"
#   end
# end

# def foo(x)
#   case x
#     when 1
#         "one"
#     else
#         "too many"
#     end
# end

# p foo(1)
# p foo(2)
# p foo(3)


def exp(base, pow)
  return 1 if pow == 0
  base * exp(base, pow - 1)
end


# p exp(1, 1)
# p exp(0, 0)
# p exp(0, 1)
# p exp(5, 3)


class Array

    def deep_dup
        first, *rest = self

        # base case
        return [] if first == nil
        return [first] + rest.deep_dup if !first.is_a?(Array) # we're at our lowest level

        # inductive case
        [first.deep_dup] + rest.deep_dup  # diving down
    end

end


# robot_parts = [
#     ["nuts", "bolts", "washers"],
#     ["capacitors", "resistors", "inductors"]
#   ]
  
# robot_parts_copy = robot_parts.deep_dup

# # p robot_parts_copy


# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# # robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
# # robot_parts[0][0] = "hi"
# p robot_parts
# p robot_parts_copy

def fibonacci_iterative(number)
  fibnums = [1,1]
  (2...number).each { |ele| fibnums << (fibnums[-1] + fibnums[-2] ) }
  fibnums[number-1]
end

def fibonacci(number)
  return 1 if number == 1 || number == 2
  fibonacci(number-1) + fibonacci(number-2)
end

# n = 10
# p fibonacci_iterative(n) == fibonacci(n)



def bsearch(sorted_arr, val)
    idx = sorted_arr.length / 2

    return nil if sorted_arr == [] 
    #return nil if sorted_arr.length == 1 && sorted_arr[0] != val
    #&&  sorted_arr[idx] != val
    # return nil if sorted_arr[idx] != val && 

    # p sorted_arr
    # p idx

    if sorted_arr[idx] == val
      idx
    elsif sorted_arr[idx] < val
      offset = bsearch(sorted_arr[idx+1..], val)
      return idx + 1 + offset if offset
      return nil
      # idx + 1 + bsearch(sorted_arr[idx+1..], val)  # [left, idx, right] => [idx, right]
    else
      bsearch(sorted_arr[...idx], val) # [left, idx, right] => [left]
    end
end


# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# p bsearch([5], 6)

def merge_sort(array)
  # base case  
  # return array if array == []
  return array if array.length <= 1

  # inductive case
  left  = merge_sort(array[0...array.length/2])
  right = merge_sort(array[array.length/2..])

  merge(left, right)

end

def merge(left, right) # merge([9,82],[10]) #=> [9]+merge([82],[10])
  return right if left == []
  #return left if right == []

  first_left = left[0]
  first_right = right[0]

  if first_left < first_right
    [first_left] + merge(left[1..], right)
  else
    [first_right] + merge(right[1..], left)
  end
end

# p twenty_shuffle = (1..20).to_a.shuffle
# p merge_sort(twenty_shuffle)
  
# p merge_sort((1..100).to_a.shuffle)

def subsets(arr)
  # base case
  return [[]] if arr == []
  # return arr if arr.length == 1

  # inductive 
  # subsets(arr[...1]) + subsets(arr[1..]) << arr
  #subsets(arr[1..]) << arr

  *firsts, last = arr
  subsets(firsts) + subsets(firsts).map { |subset| subset << last } 

end
# subsets([]) => [[]]

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => 
# [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# subsets([]) # => [[]]
# # => [[1]]
# subsets([1]) # => [[], [1]]
# # => [[2],[1,2]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# # => [[3],[1,3],[2,3],[1,2,3]]
# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# > [[4], [1, 4], [2, 4], [1, 2, 4], [3, 4]...]

def permutations(arr)
  if arr.length <= 1
    return [arr]
  end

  if arr.length == 2
    first, second = arr
    return [[first, second], [second, first]]
  end

  #arr.map { |el| permutations(arr - [el]).map { |permutation| permutation << el }  }

  first, *rest = arr

  result = Array.new(arr.length) do |index_i|
     Array.new(arr.length) do |index_j|
        permutations(rest).insert(index_i)
     end
  end
  return result
  # permutations(rest)
end

# p permutations([1])       # => [[1]]

# p permutations([1,2])     # => [[1, 2], 
                        #     [2, 1]]


p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]

# p permutations([1, 2, 3, 4])                        
                        # [[1, 2, 3, 4], [1, 2, 4, 3], [1, 3, 2, 4], [1, 3, 4, 2], [1, 4, 2, 3], [1, 4, 3, 2],
                        #  [2, 1, 3, 4], [2, 1, 4, 3], [2, 3, 1, 4], [2, 3, 4, 1], [2, 4, 1, 3], [2, 4, 3, 1],
                        #  [3, 1, 2, 4], [3, 1, 4, 2], [3, 2, 1, 4], [3, 2, 4, 1], [3, 4, 1, 2], [3, 4, 2, 1],
                        #  [4, 1, 2, 3], [4, 1, 3, 2], [4, 2, 1, 3], [4, 2, 3, 1], [4, 3, 1, 2], [4, 3, 2, 1]] 


                        
