class Triangle
  def initialize(height)
    @height = height
  end

  def rows
    to_enum(:generate_rows).first(@height)
  end

  def generate_rows
    row = [1]
    yield row
    loop do
      row = next_row(row)
      yield row
    end
  end

  def next_row(row)
    ([0] + row + [0]).each_cons(2).map(&:sum)
  end
end