class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @store.length == @count 
    key_hash = key.hash 
    if !@store[key_hash % @store.length].include?(key_hash)
      @store[key_hash % @store.length] << key_hash
      @count += 1
    end

  end

  def remove(key)
    key_hash = key.hash
    bucket = @store[key_hash % @store.length]
    if bucket.include?(key_hash)
      bucket.delete(key_hash)
      @count -= 1
    end
  end

  def include?(key)
    key_hash = key.hash 
    @store[key_hash % @store.length].include?(key_hash)
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
