class Change

        

          

  def self.generate(coins, amount)

        

          

    raise NegativeTargetError if amount.negative?

        

          

    return [] if amount.zero?

        

          


        

          

    pos = (amount.to_f / coins.min).floor

        

          

    (1..pos).each do |t|

        

          

      # all combinations have equal length for same t

        

          

      combination = coins.repeated_combination(t).find { |wariant| wariant.sum == amount }

        

          

      # length raise in asc order of t, so can return the first not nil combination

        

          

      return combination if combination

        

          

    end

        

          


        

          

    raise ImpossibleCombinationError

        

          

  end

        

          


        

          

  class ImpossibleCombinationError < StandardError; end

        

          

  class NegativeTargetError < StandardError; end

        

          

end