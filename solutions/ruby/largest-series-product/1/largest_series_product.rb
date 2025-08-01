class Series
  def initialize(sequence)
    raise ArgumentError.new() unless sequence =~ /^\d+$/

    @sequence = sequence
  end

  def largest_product(span)
    raise ArgumentError.new() if span > @sequence.length

    @sequence.chars.each_cons(span).map{|serie| product(serie)}.max
  end

  private
  def product(serie)
    serie.inject(1) {|sum, char| sum * char.to_i}
  end
end