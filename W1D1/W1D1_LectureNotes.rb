=begin
# Fist Video
p [11, 7, 2, 4].inject(100) {|acc, el| acc + el}


dont know if this works
p [11, 7, 2, 4].inject(100) do |acc, el|
 acc + el
end

food = "pizza"
p food
=end
=begin
# Second Video
$message1 = "hello"
def say_hello
 message = "hi"
 p message, $message1
 # $ = global variable
end
say_hello
=end
=begin
FOOD = "pizza" # constants need to be capitalized
p FOOD
p FOOD.upcase!
p FOOD[0] = "P"
p FOOD
FOOD = "pasta" # constants cannot be changed
=end
=begin
message = "Bye"

3.times do
  p message
end
=end
=begin
FOOD_COUNT = 2
p FOOD_COUNT


FOOD = "burger"
FOOD << "s"
# FOOD += "s"
p FOOD
=end
#Bubble Sort
=begin
def bubble_sort(arr)
  sorted = false

  until sorted
    sorted = true
    (0...arr.length - 1).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      end
    end
  end
  arr
end

arr = [2, 8, 5, 2, 6]
p bubble_sort(arr)
=end
#Object Location
=begin
word1 = "boot"
word2 = word1
word3 = "boot"
p word1.object_id == word2.object_id
p word1.object_id == word3.object_id
=end
=begin
str = "hello"
p str.object_id
p str
p str.upcase
p str
p str.upcase!
p str
p str.object_id
p str = "hello"
p str.object_id
=end

def only_vowels?(str)
  vowels = "aeiou".split("")
  str.split("").all? { |letter| vowels.include?(letter) }
end

p only_vowels?("aaoeee")  # => true
p only_vowels?("iou")     # => true
p only_vowels?("cat")     # => false
p only_vowels?("over")    # => false

