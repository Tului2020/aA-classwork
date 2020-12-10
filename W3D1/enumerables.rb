class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
  end
  

  def my_select(&prc)
    arr = []
    self.each { |el| arr << el if prc.call(el) }
    arr
  end


  def my_reject(&prc)
    arr = []
    self.each { |el| arr << el if !prc.call(el) }
    arr
  end


  def my_any?(&prc)
    self.each { |el| return true if prc.call(el) }
    false
  end


  def my_all?(&prc)
    self.each { |el| return false if !prc.call(el) }
    true
  end



  def my_flatten
    flattened = []
    self.each {|el| !el.is_a?(Array)? flattened += [el] : flattened += el.my_flatten}
    flattened
  end

  p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]





  def my_zip(*args)
    new_arr = Array.new(args.length + 1) { Array.new(0) }
    new_arr[0] = self.dup

    args.each.with_index do |arr, idx|
      (0...self.length).each do |el|
        if arr.length < el
          new_arr[idx + 1] << nil
        else
          new_arr[idx + 1] << arr[el]
        end
      end
    end
    new_arr.transpose
  end


  def my_rotate(num=1)
    new_arr = self.dup
    num1 = num % self.length
    num1.times do
      new_arr << new_arr.shift
    end
    new_arr
  end

  def my_join(str="")
    new_str = ""
    self.each { |char| new_str += char + str }
    new_str[...new_str.length-str.length]
  end

  def my_reverse
    new_arr = []
    self.each { |el| new_arr.unshift(el)}
    new_arr
  end


end


# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]