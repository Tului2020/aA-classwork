# RECURSION DAYY WOOHOO #
# ---------------------------------------------------------------------------------------------------------------------------- #
# Sums
def iter_sum(num)
    (1..num).inject { |acc, el | acc + el}
end


def rec_sum(num)
    return 1 if num == 1
    num + rec_sum(num - 1)
end

# n = 100

# p (1..n).all? { |num| rec_sum(num) == iter_sum(num)}


# (1..9000).each do |n|
#     recursive_old = Time.now
#     rec_sum(n)
#     recursive_new = Time.now
#     recursive_time = recursive_new - recursive_old


#     iterative_old = Time.now
#     iter_sum(n)
#     iterative_new = Time.now
#     iterative_time = iterative_new - iterative_old


#     # p "Recursive time for #{n}: " + (recursive_new - recursive_old).to_s
#     # p "Iterartive time: " + (iterative_new - iterative_old).to_s
#     p "The difference is for n = #{n} is #{recursive_time - iterative_time}" if n % 1000 == 0
# end


# ---------------------------------------------------------------------------------------------------------------------------- #
# Reverse a word

def rec_reverse(word)
    return word if word.length == 0
    word[-1] + rec_reverse(word[0...-1])
end

def iter_reverse(word)
    (0..word.length).map { |idx| word[-1 - idx]}.join("")
end

# word = 'jdklasjklxw'
# puts rec_reverse(word) == iter_reverse(word)




# ---------------------------------------------------------------------------------------------------------------------------- #
# all divisable sums
# this func returns a collection of numbers (Array) which are in the range of
# 1 to num which are divisable by the divisor


def all_divisable_num(num, divisor)
    # base case 
    return [] if num < divisor || divisor < 0
    return [divisor] if num == divisor
    # inductive part
    return all_divisable_num(num - 1, divisor) << num if num % divisor == 0
    all_divisable_num(num - 1, divisor) 

end


# p all_divisable_num(10, 5)
# p all_divisable_num(100, 5)
# p all_divisable_num(40, 7)


def rec_pascal(num)
    # base case
    return [[1]] if num == 1
    return [[1], [1, 1]] if num == 2

    # inductive part
    pascal = rec_pascal(num - 1)  << [1, 1]
    (1...pascal[-2].length).map { |el| pascal[-1].insert(-2, (pascal[-2][el - 1] + pascal[-2][el])) }
    pascal
end

# p rec_pascal(0)
rec_pascal(5).each { |row| p row}





