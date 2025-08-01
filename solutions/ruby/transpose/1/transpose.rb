module Transpose
  def self.transpose(input)
    return "" if input.empty?

    matrix = input.split("\n").map(&:chars)
    matrix[0].zip(*matrix[1..-1]).map{
      |row| row[0..-(row.reverse.take_while(&:nil?).length)-1].map{|c| c ||= ' '}.join
    }.join("\n")
  end
end