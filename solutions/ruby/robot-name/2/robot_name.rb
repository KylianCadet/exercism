class Robot
  @@names = []
  ALPHABET = ('A'..'Z').to_a.freeze
  NUMBER = (1..9).to_a.freeze

  attr_reader :name

  def self.forget
    @@names = []
  end

  def initialize
    reset
  end

  def reset
    @name = new_name
  end

  private
  def new_name
    name = next_possible_name
    @@names << name
    name
  end

  def next_possible_name
    return 'AA000' if @@names.length == 0

    @@names.last.next
  end
end