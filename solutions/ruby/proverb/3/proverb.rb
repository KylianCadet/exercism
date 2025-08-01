class Proverb
  def initialize(*chain, qualifier:nil)
    @chain = chain
    @final = [qualifier, chain.at(0)].compact.join(' ')
  end

  def proverb(item1, item2)
    "For want of a #{item1} the #{item2} was lost."
  end

  def final(item)
    "And all for the want of a #{item}."
  end

  def to_s
    @chain.each_cons(2)
    .map{|item1, item2| proverb(item1, item2)}
    .push(final(@final))
    .join("\n")
  end
end