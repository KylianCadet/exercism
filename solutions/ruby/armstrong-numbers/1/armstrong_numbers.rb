module ArmstrongNumbers
  def self.include?(number)
    numbers = number.to_s.chars.map(&:to_i)
    numbers.map{|i| i**numbers.length}.sum == number
  end
end
