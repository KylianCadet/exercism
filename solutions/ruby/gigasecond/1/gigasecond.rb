module Gigasecond
  def self.from(time)
    Time.at(time.to_i + 10e8)
  end
end