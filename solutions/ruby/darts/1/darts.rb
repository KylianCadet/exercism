class Darts
  attr_reader :score

  def initialize(x, y)
    @score = compute_score(x, y)
  end

  def compute_score(x, y)
    case (x**2+y**2)**0.5
    when 0..1; 10
    when 1..5; 5
    when 5..10; 1
    else 0
    end
  end
end
