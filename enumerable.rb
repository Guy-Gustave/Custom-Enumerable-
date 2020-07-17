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
    print arr
  end

  def my_all?
    value = false
    if self.empty?
      value = true
      print value
      return value
    else
      i = 0
      while i < self.length
        yield(self[i]) || self.empty? ? value = true : value = false
        i += 1
      end
      print value
      return value
    end
    
  end

  [].my_all? { |i| i < 4 } # False

end