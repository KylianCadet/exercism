class Nucleotide
  NUCLEOTIDES = 'ATCG'

  def self.from_dna(sequence)
    raise ArgumentError.new() unless sequence.match("^[#{NUCLEOTIDES}]*$")

    @sequence = sequence
    self
  end

  def self.count(nucleotide)
    @sequence.count(nucleotide)
  end

  def self.histogram
    NUCLEOTIDES.chars.map{ |nucleotide| [nucleotide, count(nucleotide)] }.to_h
  end
end
