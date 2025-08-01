module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[0..3].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    doc_a = [:OIL, :GAS]
    carry = ship_identifier.to_s[0..2].to_sym
    case carry
    when *doc_a
      :A
    else
      :B
    end
  end
end
