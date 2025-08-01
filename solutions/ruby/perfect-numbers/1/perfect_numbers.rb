module PerfectNumber
  def self.classification(number, aliquot_sum)
    {
      number == aliquot_sum => 'perfect',
      number > aliquot_sum => 'deficient',
      number < aliquot_sum => 'abundant'
    }[true]
  end


  def self.factors(number)
    (1...number).reduce(Set.new) { |acc, n|
      if (number % n).zero?
        acc << n
      end
      acc
    }.to_a
  end

  def self.classify(number)
    raise RuntimeError.new() if number <= 0

    classification(number, factors(number).sum)
  end
end