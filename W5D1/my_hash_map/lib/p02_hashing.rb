class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hsh_str = ""
    self.each { |el| hsh_str += el.to_s}
    hsh_str.to_i.hash
  end
end

class String
  def hash
    hsh_str = ""
    self.each_char { |char| hsh_str += char.ord.to_s}
    hsh_str.to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
