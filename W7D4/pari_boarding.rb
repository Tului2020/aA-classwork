# 1) Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
# Example 1:
# Input: "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.
# Example 2:
# Input: "cbbd"
# Output: "bb"


# 2) Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
# Integers in each row are sorted from left to right.
# The first integer of each row is greater than the last integer of the previous row.
# Example 1:
# Input:
# matrix = [
#   [1,   3,  5,  7],
#   [10, 11, 16, 20],
#   [23, 30, 34, 50]
# ]
# target = 3
# Output: true
# Example 2:
# Input:
# matrix = [
#   [1,   3,  5,  7],
#   [10, 11, 16, 20],
#   [23, 30, 34, 50]
# ]
# target = 13
# Output: false

def longest_substring(str)
  longest_string = ''
  (0...str.length).each do |i|
    (i+1...str.length).each do |j|
      if palindrome?(str[i..j]) && str[i..j].length > longest_string.length
        longest_string = str[i..j]
      end
    end
  end

  longest_string
end


def palindrome?(str)
  str == str.reverse
end


# p longest_substring("babad")
# p longest_substring("cbbd")
# palindrome
# p
# pa
# p




# 2) Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
# Integers in each row are sorted from left to right.
# The first integer of each row is greater than the last integer of the previous row.

# Example 1:
# Input:
# matrix = [
#   [1,   3,  5,  7],
#   [10, 11, 16, 20],
#   [23, 30, 34, 50]
# ]
# target = 3
# Output: true
# Example 2:
# Input:
# matrix = [
#   [1,   3,  5,  7],
#   [10, 11, 16, 20],
#   [23, 30, 34, 50]
# ]
# target = 13
# Output: false
# New


def search?(matrix, val)
  last_column = matrix.transpose[-1]
  i = find_index(last_column, val)

  
  if i
    return matrix[i].include?(val)
  else
    return false
  end
end


def find_index(row, val)
  if val < row[0]
    return 0
  end

  (1...row.length).each do |idx|
    if val > row[idx - 1] && val < row[idx]
      return idx
    end
  end
  return false
end


matrix = [
[1,   3,  5,  7],
[10, 11, 16, 20],
[23, 30, 34, 50]
]

val = 11


# p find_index(matrix.transpose[-1], val)
p search?(matrix, val)
