=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end



def roll
  rng = Random.new

  rng.rand(1..6)
end
  
def roll_ability
  4.times.map{roll}.sort[1..3].sum
end

class DndCharacter
  attr_reader :constitution, :strength, :dexterity, :intelligence, :wisdom, :charisma
  @@constitution_modifier = nil


  def self.modifier(n)
    @@constitution_modifier = (n - 10).div(2)
  end


  def hitpoints
    10 + (@@constitution_modifier || 0)
  end
  
  def initialize
    @strength, @dexterity, @constitution, @intelligence, @wisdom, @charisma = [roll_ability, roll_ability, roll_ability, roll_ability, roll_ability, roll_ability]
  end
end
