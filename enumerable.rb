module Enumerable
  def my_each
    return enum_for unless block_given?
    i = 0
    while i < self.length
      yield(self[i])
      i += 1     
    end
    self
  end
  
  def my_each_with_index
    return enum_for unless block_given?
    i =0
    while i < self.length
      yield(self[i], i)
      i += 1   
    end
    self
  end

  def my_select
    arr= []
    x = 0
    while x < self.length
      arr << self[x] if yield(self[x]) == true
      x += 1
    end
    arr
  end

  def my_all?
    value = false
    if self.empty?
      value = true
      return value
    else
      i = 0
      while i < self.length
        yield(self[i]) || self.empty? ? value = true : value = false
        i += 1
      end
      return value
    end
    
  end

# [].my_all? { |i| i < 4 } # False

  def my_any
    value = false
    if self.empty?
      return true
    end
    i = 0
    while i < self.length
      if yield(self[i]) == true
        return true
      end
      i += 1
    end
    return value
  end

  # print [1, 3, 7, 5].my_any { |ele| ele%2 == 0 }
end