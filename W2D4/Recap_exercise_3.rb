def no_dupes?(arr)
    hsh = Hash.new(0)
    ret = []
    arr.each { |el| hsh[el] += 1}
    hsh.each { |k, v| ret << k if v == 1 }
    ret
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []



def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each { |i| return false if arr[i] == arr[i + 1]}
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true



def char_indices(str)
    hsh = Hash.new {|hash, k| hash[k] = []}
    str.each_char.with_index { |char, idx| hsh[char] << idx }
    hsh
end

# p char_indices('mississippi')   == {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     == {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    current = ''
    longest = ''
    (0...str.length).each do |i|
        if str[i] == str[i - 1] || i == 0
            current +=str[i]
        else
            current = str[i]
        end
        if current.length >= longest.length
            longest = current
        end
    end
    longest
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy'
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def prime?(num)
    return false if num < 2
    (2...num).each { |el| return false if num % el == 0}
    true
end

def bi_prime?(num)
    num1 = num.dup
    factors = []
    divisor = 2
    while  num1 > 1
        if num1 % divisor == 0
            factors << divisor
            num1 /= divisor
            divisor = 2
        else
            divisor += 1
        end
    end
    if factors.length != 2
        return false
    else
        factors.all? { |factor| prime?(factor)}
    end

end

# p bi_prime?(14)   == true
# p bi_prime?(22)   == true
# p bi_prime?(25)   == true
# p bi_prime?(94)   == true
# p bi_prime?(24)   == false
# p bi_prime?(64)   == false



def vigenere_cipher(message, keys)
    encrypted_message = ""
    message.each_char.with_index { |char, idx| encrypted_message += ((char.ord + (keys[idx % keys.length]) - 97) % 26 + 97).chr }
    encrypted_message
end

# Examples
# p vigenere_cipher("toerrishuman", [1])        == "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     == "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  == "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            == "ceerd"
# p vigenere_cipher("yawn", [5, 1])             == "dbbo"



def vowel_rotate(str)
    hsh = {}
    str.split("").each_with_index { |char, idx| hsh[idx] = char if 'aeiou'.include?(char)}
    (0...hsh.length).each { |idx| str[hsh.keys[-idx]] = hsh.values[-1 - idx]}
    str
end

# p vowel_rotate('computer')      == "cempotur"
# p vowel_rotate('oranges')       == "erongas"
# p vowel_rotate('headphones')    == "heedphanos"
# p vowel_rotate('bootcamp')      == "baotcomp"
# p vowel_rotate('awesome')       == "ewasemo"


class String
    def select(&prc)
        return "" if prc == nil
        ret = ""
        self.each_char { |char| ret += char if prc.call(char)}
        ret
    end


    #--------------------------------------------------------------# COME BACK TO THIS ONE
    def map!(&prc)
        self.each_char.with_index { |char, idx| self[idx] = prc.call(char, idx)}
    end

end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   =="pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          =="HELLO"
# p "HELLOworld".select          == ""




#String#map!
# Extend the string class by defining a String#map! method that accepts a block. 
# The method should modify the existing string by replacing every character with 
# the result of calling the block, passing in the original character and it's index. 
# Do not use the built-in Array#map or Array#map! in your solution.

# #Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        == "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        == "DiJkStRa"



def multiply(num1, num2)
    return 0 if num2 == 0 || num1 == 0
    return num1 if num2 == 1
    if num2 < 0
        -num1 + multiply(-num1, -num2 - 1)
    else
        num1 + multiply(num1, num2 - 1 * (num2 / num2.abs))
    end
end


# Examples
# p multiply(3, 5)        == 15
# p multiply(5, 3)        ==  15
# p multiply(2, 4)        ==  8
# p multiply(10, 0)       ==  0
# p multiply(-3, -6)      ==  18
# p multiply(3, -6)       ==  -18
# p multiply(-3, 6)       ==  -18



def lucas_sequence(num)
    return [] if num == 0 
    return [2] if num == 1 
    return [2, 1] if num == 2
    lucas_sequence(num - 1) << lucas_sequence(num - 1)[-1] + lucas_sequence(num - 1)[-2]
end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]





def prime_factorization(num)
    num1 = num.dup
    factors = []
    divisor = 2
    while  num1 > 1
        if num1 % divisor == 0
            factors << divisor
            num1 /= divisor
            divisor = 2
        else
            divisor += 1
        end
    end
    factors
end



# p prime_factorization(12)     == [2, 2, 3]
# p prime_factorization(24)     == [2, 2, 2, 3]
# p prime_factorization(25)     == [5, 5]
# p prime_factorization(60)     == [2, 2, 3, 5]
# p prime_factorization(7)      == [7]
# p prime_factorization(11)     == [11]
# p prime_factorization(2017)   == [2017]