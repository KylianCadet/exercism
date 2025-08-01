module PerfectNumber
  def self.classification(number, aliquot_sum)
    {
      number == aliquot_sum => 'perfect',
      number > aliquot_sum => 'deficient',
      number < aliquot_sum => 'abundant'
    }[true]
  end


  def self.factors(number)
    (1...number).to_a.select{|n| (number % n).zero?}
  end

  def self.classify(number)
    raise RuntimeError.new() if number <= 0

    classification(number, factors(number).sum)
  end
end