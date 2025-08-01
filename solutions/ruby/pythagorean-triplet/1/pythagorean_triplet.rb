module PythagoreanTriplet
  def self.triplets_with_sum(n)
    triplets = Set.new()

    (1..n/3.floor+1).each {|a|
      b = (n**2 - 2 * a * n) / (2 * (n - a)).floor
      c = n - a - b

      if a**2+b**2==c**2 && b > 0 && c > 0 && b > a
        triplets << [a,b,c]
      end
    }

    triplets.to_a
  end
end