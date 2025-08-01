class Garden
  CHILDRENS = %w[Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry]
  PLANTS = {
    'V' => :violets,
    'R' => :radishes,
    'C' => :clover,
    'G' => :grass
  }

  CHILDRENS.each{|children|
    define_method(children.downcase) {
      @hash[children]
    }
  }


  def to_symbol(plant)
    PLANTS[plant] or plant
  end

  def initialize(garden)
    @hash = garden
    .split("\n")
    .map(&:chars)
    .transpose
    .each_slice(2)
    .to_a
    .map(&:transpose)
    .map(&:flatten)
    .zip(CHILDRENS)
    .each_with_object({}) {|(plants, children), hash|
      hash[children] = plants.map{|plant| to_symbol(plant)}
    }
  end

end