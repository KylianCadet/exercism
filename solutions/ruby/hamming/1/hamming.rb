module Hamming
  def self.compute(dna_a, dna_b)
    raise ArgumentError.new() unless dna_a.length == dna_b.length
    dna_a.chars.zip(dna_b.chars).filter{|a,b| a!=b}.length
  end
end