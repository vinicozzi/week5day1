class Integer
  # Integer#hash already implemented for you
  
end

class Array
  def hash
    result = 0
    each_with_index do |el, idx|
      result += el.hash * (idx + 1)
    end
    result
  end
end


class String
  def hash
    
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end