class InvalidCodonError < StandardError
  def initialize(message)
    message
  end
end

module Translation
  PROTEIN = {
    'AUG' => "Methionine",
    **['UUU', 'UUC'].map{|codon| [codon, "Phenylalanine"]}.to_h,
    **['UUA', 'UUG'].map{|codon| [codon, "Leucine"]}.to_h,
    **['UCU', 'UCC', 'UCA', 'UCG'].map{|codon| [codon, "Serine"]}.to_h,
    **['UAU', 'UAC'].map{|codon| [codon, "Tyrosine"]}.to_h,
    **['UGU', 'UGC'].map{|codon| [codon, "Cysteine"]}.to_h,
    'UGG' => 'Tryptophan',
    **['UAA', 'UAG', 'UGA'].map{|codon| [codon, :stop]}.to_h
  }

  def self.of_rna(strand)
    codons(strand)
      .lazy
      .map{|codon|
        protein = PROTEIN[codon]
        raise InvalidCodonError.new(protein) if protein.nil?
        protein
      }
      .take_while {|protein| protein != :stop}
      .force
  end

  def self.codons(strand)
    strand.chars.each_slice(3).to_a.map(&:join)
  end
end
