require 'byebug'

class MaxIntSet
  attr_reader :store
  def initialize(max)
    # @max = max
    @store = Array.new(max + 1, false) 
  end

  def insert(num)
    raise "Out of bounds" if num >= @store.length || num < 0   
    @store[num] = true  
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % @store.length] << num
  end

  def remove(num)
    @store[num % @store.length] -= [num]
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @store.length == @count 

    if !@store[num % @store.length].include?(num)
      @store[num % @store.length] << num
      @count += 1
    end
  end

  def remove(num)
    bucket = @store[num % @store.length]
    if bucket.include?(num)
      bucket.delete(num)
      @count -= 1
    end
  end

  def include?(num)
     @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    flattened = @store.flatten
    array = Array.new(@store.length * 2){Array.new}   
    flattened.each{ |ele| array[ele % array.length] << ele  }
    @store = array    
  end
end
