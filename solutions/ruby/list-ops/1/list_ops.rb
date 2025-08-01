module ListOps
  def self.arrays(array)
    len = 0
    array.each {|_|
      len += 1
    }
    len
  end

  def self.reverser(array)
    len = arrays(array)
    len.div(2).floor.times.each {|index|
      end_index = len - index -1
      array[index], array[end_index] = array[end_index], array[index]
    }
    array
  end

  def self.concatter(array1, array2)
    array1_len = arrays(array1)
    array2_len = arrays(array2)
    new_array = Array.new(array1_len + array2_len)

    array1_len.times.each{|index|
      new_array[index] = array1[index]
    }
    array2_len.times.each{|index|
      new_array[index + array1_len] = array2[index]
    }
    new_array
  end

  def self.mapper(array, &closure)
    len = arrays(array)
    new_array = Array.new(len)
    len.times.each{|index|
      new_array[index] = closure.call(array[index])
    }
    new_array
  end

  def self.filterer(array, &closure)
    return array if closure.nil?

    len = arrays(array)

    new_array_size = 0
    len.times.each{|index|
      next if closure.call(array[index]) == false
      new_array_size+=1
    }

    new_array = Array.new(new_array_size)
    i = 0
    len.times.each{|index|
      next if closure.call(array[index]) == false
      new_array[i] = array[index]
      i+=1
    }
    new_array
  end

  def self.sum_reducer(array)
    sum = 0
    len = arrays(array)
    len.times.each{|index|
      sum += array[index]
    }
    sum
  end

  def self.factorial_reducer(array)
    fact = 1
    len = arrays(array)
    len.times.each{|index|
      fact *= array[index]
    }
    fact
  end
end
