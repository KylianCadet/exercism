
module Prime
  def self.prime?(number)
    (2..(number**0.5)).find{|i| number % i == 0}.nil?
  end

  def self.generator
    Enumerator.new do |enum|
      number = 2

      loop do
        if prime?(number)
          enum.yield number
        end
        number += 1
      end
    end
  end

  def self.nth(n)
    raise ArgumentError.new() if n <= 0

    prime_generator = generator
    (0..n-1).map{prime_generator.next}.last
  end
end