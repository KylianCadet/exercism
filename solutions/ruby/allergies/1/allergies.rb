class Allergies
  attr_reader :list

  ALLERGIES = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]

  def initialize(score)
    @score = score
    @list = ALLERGIES.filter.with_index{|_, index|
      @score & (2**index) > 0
    }
  end

  def allergic_to?(item)
    @list.include? item
  end
end
