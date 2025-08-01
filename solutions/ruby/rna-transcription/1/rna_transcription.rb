module Complement
  DNA_TO_RNA = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze
  def self.of_dna(dna)
    dna.chars.map{|c| DNA_TO_RNA[c] || ''}.join
  end
end