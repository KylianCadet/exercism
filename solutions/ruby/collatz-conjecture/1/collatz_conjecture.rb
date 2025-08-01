module CollatzConjecture
  def self.steps(n)
    raise ArgumentError.new() if n <= 0

    steps = 0

    while n != 1
      if n.even?
        n /= 2
      else
        n *= 3
        n += 1
      end
      steps += 1
    end

    steps
  end
end