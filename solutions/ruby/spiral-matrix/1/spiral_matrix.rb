=begin
Write your code for the 'Spiral Matrix' exercise in this file. Make the tests in
`spiraL_matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/spiral-matrix` directory.
=end

class SpiralMatrix
  def initialize(n)
    @n = n
  end

  def matrix
    m = @n.times.map{@n.times.map{0}}
    x = 0
    y = 0
    i = 1
    direction_list = [1, 0], [0, 1], [-1, 0], [0, -1]
    direction_list_index = 0
    direction = direction_list[direction_list_index]
    while i != (@n * @n) + 1
      m[y][x] = i
      a,b = direction
      if x+a >= @n || y+b >= @n || x+a < 0 || y+b < 0 || m[y+b][x+a] != 0
        direction_list_index += 1
        direction = direction_list[direction_list_index % direction_list.length]
        a,b = direction
      end
      x += a
      y += b
      i += 1
    end
    m
  end
end

