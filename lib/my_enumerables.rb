module Enumerable
  def my_each_with_index
    if block_given?
      i = 0
      while i < self.length do
        yield(self[i], i)
        i += 1
      end
    end
    self
  end

  def my_select
    selected_elems = []
    self.my_each do |elem|
      selected_elems << elem if yield(elem)
    end
    selected_elems
  end

  def my_all?
    self.my_each do |elem|
      if not yield(elem)
        return false
      end
    end
    true
  end

  def my_any?
    self.my_each do |elem|
      if yield(elem)
        return true
      end
    end
    false
  end

  def my_none?
    self.my_each do |elem|
      if yield(elem)
        return false
      end
    end
    true
  end

  def my_count
    elem_count = 0
    self.my_each do |elem|
      if block_given?
          elem_count += 1 if yield(elem)
      else
        elem_count += 1
      end
    end
    elem_count
  end

  def my_map(&my_block)
    mapped_values = []
    self.my_each do |elem|
      mapped_values << my_block.call(elem)
    end
    mapped_values
  end

  def my_inject(sum, &my_block)
    self.my_each do |elem|
      sum = my_block.call(sum, elem)
    end
    sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for val in self
      yield(val)
    end
  end
end
