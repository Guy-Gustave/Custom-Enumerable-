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

  def my_any?
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

  def my_none?
    value = true
    if self.empty?
      return true
    end
    i = 0
    while i < self.length
      if yield(self[i]) == true
        return false
      end
      i += 1
    end
    return value
  end

  def my_count(arg = nil)
    return self.length if arg == nil && !block_given?
    counter = 0
    if block_given?
      i = 0
      while i < self.length
        counter += 1 if yield(self[i])
        i += 1
      end
      return counter
    else
      i = 0
      while i < self.length
        if self[i] == arg
          counter += 1
        end
        i += 1
      end
      return counter
    end
  end

  # ary = [1, 2, 3, 5, 10, 2, 'Hi', 'Hello']
  # print ary.my_count

  def my_map
    return enum_for unless block_given?
    i = 0
    arr = []
    while i < self.length
      arr.push(yield(self[i]))
      i += 1
    end
    return arr
  end
  # print [12, 1, 1, 3, 4].my_map { |i| i * i }

  def my_inject(arg = nil, sym = nil)
    # self.is_a?(Array) ? self : self.to_a
    acc = self[0]
    if arg == nil && sym == nil
      i = 1
      while i < self.length
        acc = yield(acc, self[i])
        i += 1
      end
    elsif !arg.nil? && sym.nil?
      if arg.is_a?(Integer)
        acc = arg
        i = 0
        while i < self.length
          acc = yield(acc, self[i])
          i += 1
        end
      elsif arg.is_a?(String) || arg.is_a?(Symbol)
        acc = self[0]
        i = 1
        while i < self.length
          acc = acc.send(arg, self[i])
          i += 1
        end
      end
    elsif !arg.nil? && !sym.nil?
      acc = arg
      i = 0
      while i < self.length
        acc = acc.send(sym, self[i])
        i += 1
      end
    end
    return acc
  end

end

def multiply_els(arr)
  arr.my_inject(:*)
end
# (0..10).inject { |sum, number| sum + number }

# print [1, 2, 3, 4].inject(2) { |sum, number| sum * number }

print multiply_els([2, 4, 5])