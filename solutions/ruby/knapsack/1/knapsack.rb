class Knapsack
  def initialize(max_weight)
    @max_weight = max_weight
  end

  def max_value(items)
    @matrix = ((0..items.length).map{(0..@max_weight).map{-1}})
    knapsack(items.map{_1.weight}, items.map{_1.value}, @max_weight, items.length)
  end

  def knapsack(weights, values, max_weight, value_len)
    return 0 if value_len.zero? || max_weight.zero?
    
    return @matrix[value_len][max_weight] if @matrix[value_len][max_weight] != -1

    if weights[value_len - 1] <= max_weight
      @matrix[value_len][max_weight] = [
        values[value_len - 1] +
        knapsack(weights, values, max_weight - weights[value_len - 1], value_len - 1),
        knapsack(weights, values, max_weight, value_len - 1)
      ].max
      return @matrix[value_len][max_weight]
    elsif weights[value_len - 1] > max_weight
      @matrix[value_len][max_weight] = knapsack(weights, values, max_weight, value_len - 1)
      return @matrix[value_len][max_weight]
    end
  end
end
