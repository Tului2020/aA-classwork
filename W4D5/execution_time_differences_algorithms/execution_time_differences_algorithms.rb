def my_min_v1(list)
  old_time = Time.now
  (0...list.length).each do |i| 
    smallest = true
    (0...list.length).each do |j|
      if list[i] < list[j]
        smallest = false
      end
    end
    if smallest
      return Time.now - old_time
    end
  end
end

# arr1 = (0..100).to_a
# arr2 = (0..1000).to_a
# arr3 = (0..10000).to_a
# arr4 = (0..100000).to_a

# p my_min(arr1)
# p my_min(arr2)
# p my_min(arr3)
# p my_min(arr4)

def my_min_v2(list)
    old_time = Time.now
    list.inject { |acc, el| [acc, el].max}
    Time.now - old_time
end

# arr1 = (0..100).to_a
# arr2 = (0..1000).to_a
# arr3 = (0..10000).to_a
# arr4 = (0..100000).to_a

# p my_min_v2(arr1)
# p my_min_v2(arr2)
# p my_min_v2(arr3)
# p my_min_v2(arr4)


def largest_contiguous_subsum(list)
    old_time = Time.now
    new_arr = []
    (0...list.length).each do |idx1| 
      (idx1...list.length).each do |idx2|  
            new_arr << list[idx1..idx2]
        end
    end
    new_arr.map { |sub| sub.sum}.max
    Time.now - old_time
end

arr1 = (0..1000).to_a
# arr2 = (0..2000).to_a
# arr3 = (0..3000).to_a
# arr4 = (0..4000).to_a

p largest_contiguous_subsum(arr1)
# p largest_contiguous_subsum(arr2)
# p largest_contiguous_subsum(arr3)
# p largest_contiguous_subsum(arr4)
p ""


def largest_contiguous_subsum_v2(list)
    old_time = Time.now
    max_num = 0
    (0...list.length).each do |idx1| 
        (idx1...list.length).each do |idx2| 
            s = list[idx1..idx2].sum
            max_num = s if max_num < s
        end
    end
    Time.now - old_time
end

p largest_contiguous_subsum_v2(arr1)
# p largest_contiguous_subsum_v2(arr2)
# p largest_contiguous_subsum_v2(arr3)
# p largest_contiguous_subsum_v2(arr4)









#O(n^3) cubic time
#O(n^3) cubic space
def largest_contiguous_subsum1(array)
    subs = []
  
    array.each_index do |idx1|
      (idx1..array.length - 1).each do |idx2|
        subs << array[idx1..idx2]
      end
    end
  
    subs.map { |sub| sub.inject(:+) }.max
  end
  
  #O(n) linear time
  #O(1) constant space
  def largest_contiguous_subsum2(arr)
    old_time = Time.now
    largest = arr.first
    current = arr.first
  
    (1...arr.length).each do |i|
      current = 0 if current < 0
      current += arr[i]
      largest = current if current > largest
    end
  
    Time.now - old_time
  end

  p largest_contiguous_subsum2(arr1)
#   p largest_contiguous_subsum2(arr2)
#   p largest_contiguous_subsum2(arr3)
#   p largest_contiguous_subsum2(arr4)
  



# arr = [1, 2, -4, 4, -3, 4]
# [1, 3, 3, 4, 4, 5]
# current_sum = [1, 3, -1, 4, 1, 5]





  