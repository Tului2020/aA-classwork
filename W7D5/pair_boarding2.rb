


# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
# Example:
# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]


def zero2back(arr)

  zero_arr = []
  nonzero_arr = []

  arr.each do |el|
    if el == 0
      zero_arr << el
    else
      nonzero_arr << el
    end
  end
  nonzero_arr + zero_arr
end


# p zero2back([0,1,0,3,12])


# 1)
# You are climbing a stair case. It takes n steps to reach to the top.
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
# Note: Given n will be a positive integer.
# Example 1:
# Input: 2
# Output: 2
# Explanation: There are two ways to climb to the top.
# 1. 1 step + 1 step
# 2. 2 steps
# Example 2:
# Input: 3
# Output: 3
# Explanation: There are three ways to climb to the top.
# 1. 1 step + 1 step + 1 step
# 2. 1 step + 2 steps
# 3. 2 steps + 1 step
# Examples
# 1 step => 1 way
# 2 steps => 2 ways
# 3 steps => 3 ways
# 4 steps => 1111, 22, 112, 121, 211 => 5 ways
# 5 steps => 11111, 1112, 1121, 1211, 2111, 122, 212, 221 => 8 ways
# 6 steps => 111111, 11112, 11121, 11211, 12111, 21111, 1122, 1221, 2211, 1212, 2112, 2121, 222 => 13 ways

# Version 1
def num_ways1(steps)
    return steps if steps <= 3
    return num_ways1(steps - 2) + num_ways1(steps - 1)
end

# 1 * N + 2 * M
# Version 2

def num_ways2(steps)
  steps_arr = []
  (0..steps/2+1).each do |m|
    n = steps - 2 * m
    intermediate_steps = []
    if n >= 0
      m.times { intermediate_steps << 2}
      n.times { intermediate_steps << 1}
    end
    
    steps_arr += intermediate_steps.permutation.uniq unless intermediate_steps.empty?
  end
  steps_arr.length
end

(1..10).each {|steps| p num_ways2(steps) == num_ways1(steps)}
