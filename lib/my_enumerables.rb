module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |element|
      yield(element, index)
      index += 1
    end

    self
  end

  def my_select
    filtered_array = []
    my_each { |element| filtered_array << element if yield(element) }

    filtered_array
  end

  def my_all?
    my_each { |element| return false unless yield(element) }

    true
  end

  def my_any?
    my_each { |element| return true if yield(element) }

    false
  end

  def my_none?
    my_each { |element| return false if yield(element) }

    true
  end

  def my_count
    return length unless block_given?

    count = 0
    my_each { |element| count += 1 if yield(element) }
    count
  end

  def my_map
    transformed_array = []
    my_each { |element| transformed_array << yield(element) }

    transformed_array
  end

  def my_inject(initial_value)
    memo = initial_value
    my_each { |element| memo = yield(memo, element) }
    memo
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    length.times do |i|
      yield self[i]
    end

    self
  end
end
