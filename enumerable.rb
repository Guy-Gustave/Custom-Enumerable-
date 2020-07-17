module Enumerable
  def my_each
    return enum_for  unless block_given?
    i =0
    while i < self.length
      yield(self[i])
      i +=1     
    end
    self
  end
  
  def my_each_with_index
    return enum_for unless block_given?
    i =0
    while i < self.length
      yield(self[i],i)
      i +=1   
    end
    self
  end

  def my_select
    arr= []
    x=0
    while x <self.length
      arr << self[x] if yield(self[x]) ==true
      x+=1
    end
    arr
  end

  arr = [3,1,2]
  arr.my_each_with_index {|el| puts el*2}

  arr = [1, 2, 3, 4]
  arr.my_select {|ele| puts ele*3}

  def my_all?
    my_each{|ele| return false if yield(ele)== true}    
  end

end