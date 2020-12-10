def strange_sums(arr)
  count = 0
  arr.each.with_index do |el, idx|
    (idx + 1...arr.length).each do |jdx|
      if (el + arr[jdx] == 0)
        count += 1
      end
    end
  end
  count
end


# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product( numbers , product )
  numbers.each.with_index do |el, idx|
    (idx + 1...numbers.length).each do |jdx|
      if (el * numbers[jdx] == product)
        return true
      end
    end
  end
  false
end



# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false


def rampant_repeats(str, hsh)
  new_str = ""
  str.each_char { |char| (hsh.include?(char))? (new_str << char * hsh[char]) : (new_str << char)}
  new_str
end


# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'


def perfect_square(number)
  Math.sqrt(number).to_i == Math.sqrt(number)
end


# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false


############################################################################################
# PHASE 2
# COME BACK TO THIS ONE
def anti_prime?(number)
  factor = number_factors(number)
  (1...number).none? { |num| number_factors(num) > (factor)}
  end


def number_factors(number)
  (1..number).count { |num| number % num == 0}
end



# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false



def matrix_addition(mat1, mat2)
  n, m = mat1.length, mat1[0].length
  new_matrix = Array.new(n) {Array.new(m)}
  (0...n).each do |idx|
    (0...m).each do |jdx|
      new_matrix[idx][jdx] = mat1[idx][jdx] + mat2[idx][jdx]
    end
  end
  new_matrix
end


# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]
# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]


def mutual_factors(*nums)
  factors = []
  (1..nums.min).each {|factor| factors << factor if nums.all? {|num| num % factor == 0}}
  factors
end


  # p mutual_factors(50, 30)            # [1, 2, 5, 10]
  # p mutual_factors(50, 30, 45, 105)   # [1, 5]
  # p mutual_factors(8, 4)              # [1, 2, 4]
  # p mutual_factors(8, 4, 10)          # [1, 2]
  # p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
  # p mutual_factors(12, 24, 64)        # [1, 2, 4]
  # p mutual_factors(22, 44)            # [1, 2, 11, 22]
  # p mutual_factors(22, 44, 11)        # [1, 11]
  # p mutual_factors(7)                 # [1, 7]
  # p mutual_factors(7, 9)              # [1]


def tribonacci_number(n)
  arr = [1, 1, 2]
  (0..n - 3).each { |fib| arr << arr[-1] + arr[-2] + arr[-3]}
  arr[n - 1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274



############################################################################################
# PHASE 3

def matrix_addition_reloaded(*mats)
  n, m = mats[0].length, mats[0][0].length
  return nil if !mats.all? { |mat| mat.length == n && mat[0].length == m }

  new_matrix = Array.new(n) {Array.new(m) {0}}
  (0...n).each do |idx|
    (0...m).each do |jdx|
      mats.each {|mat| new_matrix[idx][jdx] += mat[idx][jdx]}
    end
  end
  new_matrix
end


# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil


def squarocol?(mtr)
  mtr.each { |arr| return true if arr.uniq.length == 1}
  mtr.transpose().each { |arr| return true if arr.uniq.length == 1}
  false
end

# p squarocol?([
#   [:a, :x , :d],
#   [:b, :x , :e],
#   [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal? (mtr)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  (0...mtr.length).each {|idx| hash1[mtr[idx][idx]] += 1 }
  return true if hash1.length == 1
  (0...mtr.length).each {|idx| hash2[mtr[idx][-1 - idx]] += 1 }
  return true if hash2.length == 1
  false
end



# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false


def pascals_triangle(n)
  triangle = [[1], [1, 1]]
  (3..n).each do |i|
    arr = Array.new(i) {0}
    arr[0], arr[-1] = 1, 1
    (1...i-1).each do |j|
      arr[j] =  triangle[-1][j - 1] + triangle[-1][j]
    end
    triangle << arr
  end
  triangle
end



# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]




def prime?(num)
  return false if num < 2
  (2...num).none? {|factor| num % factor == 0 }
end

def mersenne_prime(num)
  primes = []
  i = 1
  until primes.length == num
    prime = 2 ** i - 1
    primes << prime if prime?(prime)
    i += 1
  end
  primes[-1]
end


# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071 



def triangular_word?(word)
  val = word.bytes.sum - 96 * word.length
  c1 = (-1 + (1 - 4 * (-2 * val)) ** 0.5) / 2
  c1 == c1.round
end 


# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false


def consecutive_collapse(arr)
  return arr if arr.length < 2
  new_arr = arr.dup
  idx = 0
  while idx < new_arr.length - 1
    if (new_arr[idx] - new_arr[idx + 1]).abs == 1
      2.times {new_arr.delete_at(idx)}
      idx = 0
    else
      idx += 1
    end 
  end
  new_arr
end


# p consecutive_collapse([3, 4, 1])                     == [1]
# p consecutive_collapse([1, 4, 3, 7])                  == [1, 7]
# p consecutive_collapse([9, 8, 2])                     == [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               == [6]
# p consecutive_collapse(([1, 9, 8, 6, 4, 5, 7, 9, 2]))   == [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               == [1]
# p consecutive_collapse([5, 7, 9, 9])                  == [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              == []



def pretentious_primes(arr, num)
  new_arr = []
  arr.each do |el|
    temp_primes = []
    i = num / num.abs
      until temp_primes.length >= num.abs
        temp_primes << (el + i) if prime?(el + i)
        i += num / num.abs
        if el + i < 0
          temp_primes << nil
        end
      end
    new_arr << temp_primes[-1]
  end
  new_arr
end



p pretentious_primes([4, 15, 7], 1)           == [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           == [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  == [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  == [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          == [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          == [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         == [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         == [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         == [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         == [17, nil, nil]


