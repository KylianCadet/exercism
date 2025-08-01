class Robot
  ALPHABET = ('a'..'z').to_a.freeze
  @@names = []

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

    a,b,c,d,e = @@names.last.chars
    e = e.to_i + 1
    if e == 10
      e = 0
      d = d.to_i + 1
    end
    if d == 10
      d = 0
      c = c.to_i + 1
    end
    if c == 10
      c = 0
      b = (b.ord + 1).chr
    end
    if b > 'Z'
      b = 'A'
      a = (a.ord + 1).chr
    end

    [a,b,c,d,e].join
  end
end