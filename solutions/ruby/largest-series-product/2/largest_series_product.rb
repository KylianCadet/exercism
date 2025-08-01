class Series
  def initialize(sequence)
    raise ArgumentError.new() unless sequence =~ /^\d+$/

    @sequence = sequence
  end

  def largest_product(span)
    raise ArgumentError.new() if span > @sequence.length

    @sequence.chars.map(&:to_i).each_cons(span).map{|serie| serie.inject(:*)}.max
  end
end