module PhoneNumber
  def self.clean(phone_number)
    match = phone_number.match(/^(\+?1)?\s*\(?(?<npa>[2-9]\d{2})\)?[\.\s-]*(?<exchange>[2-9]\d{2})[\.\s-]*(?<subscriber>\d{4})\s*$/)
    return nil unless match
    npa = match['npa']
    exchange = match['exchange']
    subscriber = match['subscriber']
    "#{npa}#{exchange}#{subscriber}"
  end
end