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
      return value
    end
    
  end

  print [].my_all? { |i| i < 4 } # False

  def my_any
    value= false
    if self.empty?
      value = true
      return value
    end
    i =0
    while i < self.length
      if yield(self[i]) ==true
  
        value = true
      end
      i+=1
    end
    print value    
  end

  print [2,4,7,8,9].my_any  { |x| x.odd? }
end