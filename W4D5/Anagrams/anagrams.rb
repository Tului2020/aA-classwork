class String
  def first_anagram(arr)
    permutations = []
    (0...self.length).each do |el|
      current_word = self.new_word(el)
      (0...self.length).each { |ele| permutations << current_word.rotate(ele) unless permutations.include?(current_word.rotate(ele)) }
    end
    permutations
  end
  
  def rotate
      new_array = self.split("")
      new_array << new_array.shift
      new_array.join("")
  end

  def new_word(index)
    new_array = self.split("")
    new_array << new_array.delete_at(index)
    new_array.join("")
  end

end


# [a, b, c, d]
  # [a, c, b, d]
  # [a, c, d, b]
# [b, a, c, d]
  # []
# [b, c, a, d]
# [b, c, d, a]

# word = "gizmo"

# words_1 = word.first_anagram('') 
# words_2 = word.split("").permutation.to_a.map {|el| el.join("")}

# hsh1 = Hash.new(0)
# hsh2 = Hash.new(0)

# words_1.each { |sub| hsh1[sub] += 1}
# words_2.each { |sub| hsh2[sub] += 1}

# p hsh1.length
# p hsh2.length
# p hsh1 == hsh2




# gizmo => izmog(rotate)
# gzmoi 
# gimoz
# gizom


# p "gizmo".first_anagram("sally")    #=> false
# p "elvis".first_anagram("lives")    #=> true


# 012x   102z    210y
# 021y   120x    201x

# x = 012, 120, 201
# y = 021, 210, 102
# z = 120

# p [0, 1, 2].permutation.to_a.map {|el| el.join("")}

def permutation_v2(arr)
    return [arr[1], arr[0]] if arr.length == 2
    return [arr[0], permutation_v2(arr[1..-1])]
end

# arr = [1, 2, 3]
# p permutation_v2(arr)



# 0123   0132   0213   0231   0312   0321    
# 1230   1302   1023   
# 2301   2013   2130   
# 3012   3120   3201


# def perm(arr, i=-1)
#     # base
#     return [] if i % arr.length == 2
    
#     # s = i
#     # until s % arr.length == -1

#     #   s += 1
#     # end
#     new_arr = arr.dup
#     # new_arr.map |j| 
#     new_arr[i - j], new_arr[i - 1 - j] = new_arr[i - 1 - j], new_arr[i - j]
#     [new_arr] + perm(new_arr, i - 1)

#     [arr] + x
# end





def perm_v3(arr)
  new_arr = []
  idx = -2
  while idx > (arr.length * -1)
    current_rotating_array = arr[idx..-1]
    num_times = 0
    while num_times < current_rotating_array.length
      current_rotating_array = current_rotating_array.rotate
      new_arr << arr[0..idx - 1] + current_rotating_array
      num_times += 1
    end
    idx -= 1
  end
  new_arr
end



def dot_product(arr1, arr2)
  [arr1].product(arr2).map { |el| el.flatten}
end

def rotate(arr, num)
  num.times {arr << arr.shift}
  arr
end







def perm_v5(arr)

  ret = dot_product(arr[0], arr[1..-1])
  until ret[0].length == arr.length
    temp = []
    ret.each { |el| temp += dot_product(el, arr - el) }
    ret = temp
  end
  p x = temp.length

  # (0...x).each do |el|
  #   # p ret[el]
  #   (1..arr.length).each do |rot|
    # ret += [rotate(ret[el], 1)]
  #   end
  # end
  # ret +=  [rotate(ret[0], 1)]
  ret
end

p perm_v5([0, 1, 2, 3])#.length
# p [0, 1, 2, 3].permutation.to_a.length

