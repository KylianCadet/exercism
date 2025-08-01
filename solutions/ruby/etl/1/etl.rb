module ETL
  def self.transform(table)
    table.map {
      |key, value| value.map{|char| [char.downcase, key]}.to_h
    }.reduce({}) {
      |acc, hash| acc.merge(hash)
    }
  end
end

