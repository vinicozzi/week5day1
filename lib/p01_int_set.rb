class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max 
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num >= @max
    @store[num] = true
  end

  def remove(num)
    raise "Out of bounds" if num < 0 || num >= @max
    @store[num] = false
  end

  def include?(num)
    raise "Out of bounds" if num < 0 || num >= @max
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
    num_idx = num % @store.length 
    @store[num_idx] = num 
  end

  def remove(num)
    num_idx = num % @store.length 
    @store[num_idx] = "" 
  end

  def include?(num)
    return true if @store.include?(num)
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
    return false if self.include?(num)
    self.resize! if @count >= num_buckets 
    num_idx = num % @store.length 
    @store[num_idx] << num 
    @count += 1
    return true 
  end

  def remove(num)
    return false unless self.include?(num)
    num_idx = num % @store.length
    @store[num_idx].delete(num)
    @count -= 1 
    return true 
  end
  

  def include?(num)
      num_idx = num % @store.length
      @store[num_idx].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(2 * num_buckets) { Array.new }
    @store.each do |bucket|
      bucket.each do |num|
        new_bucket_idx = num % new_store.length
        new_store[new_bucket_idx] << num
      end
    end
    @store = new_store
  end

  def [](num)
    bucket_idx = num % @store.length
    @store[bucket_idx]
    # optional but useful; return the bucket corresponding to `num`
  end
end