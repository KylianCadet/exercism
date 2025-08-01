module PrimeFactors
  def self.prime_generator
    n = 2
    loop do
      yield n if (2...(n**0.5).ceil).all?{|i| n % i != 0}
      n += 1
    end
  end

  def self.of(n)
    return [] if n < 2

    primes = []

    to_enum(:prime_generator)
    .lazy
    .take_while {|prime|
      while n % prime == 0
        primes << prime
        n /= prime
      end
      n != 1
    }
    .force

    primes
  end
end
