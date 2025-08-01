class Triangle
  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    @sides.uniq.length == 1 unless @sides[0].zero?
  end

  def isosceles?
    @sides.uniq.length <= 2 unless @sides.count(@sides.min) == 2
  end

  def scalene?
    @sides.uniq.length == 3 unless inequality?
  end

  private
  def inequality?
    a, b, c = @sides
    a + b < c or b + c < a or a + c < b
  end
end