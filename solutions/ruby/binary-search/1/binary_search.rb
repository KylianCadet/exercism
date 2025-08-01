class BinarySearch
  def initialize(list)
    @list = list
  end

  def search_for(number)
    l = 0
    r = @list.length - 1

    while l <= r
      m = (l + r) / 2.floor
      if @list[m] < number
        l = m + 1
      elsif @list[m] > number
        r = m - 1
      else
        return m
      end
    end

    nil
  end
end