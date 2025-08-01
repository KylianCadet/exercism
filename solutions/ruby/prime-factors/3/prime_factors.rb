module PrimeFactors
  def self.min_divisor(number)
    (2..(number**0.5).ceil).each {|n|
      return n if (number % n).zero?
    }
    nil
  end

  def self.of(n)
    primes = []

    until n == 1
      prime = min_divisor(n)
      return primes << n if prime.nil?
      primes << prime
      n /= prime
    end

    primes
  end
end
