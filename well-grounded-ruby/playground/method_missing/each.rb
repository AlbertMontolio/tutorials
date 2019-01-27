class Array
  def my_each
    c = 0
    until c == self.size
      yield(self[c])
      c += 1
    end
    return self
  end

  def my_map
    acc = []
    self.my_each do |e|
      acc << yield(e) 
    end
    acc
  end
end

array = [1, 2, 3]
array.my_each do |n|
  puts n * 2
end

new_array = array.my_map do |e|
  e * 2
end

p new_array
