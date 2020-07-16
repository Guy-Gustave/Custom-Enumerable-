module enumerable
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
  end
end