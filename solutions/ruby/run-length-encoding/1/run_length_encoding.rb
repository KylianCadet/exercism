module RunLengthEncoding
  def self.encode(input)
    input
      .to_enum(:scan, /([\w\s])\1*/)
      .map{$&}
      .map{|c| c.length > 1 ? "#{c.length}#{c[0]}" : c}
      .join
  end

  def self.decode(input)
    input
      .to_enum(:scan, /\d*[A-Za-z\s]/)
      .map{$&}
      .map(&:chars)
      .map{|*digits, letter| letter * [digits.join.to_i, 1].max}
      .join
  end
end

