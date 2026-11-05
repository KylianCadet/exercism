class Series
  def initialize(series)
    raise ArgumentError.new() if series.empty?
    @series = series.chars
  end

  def slices(slice)
    raise ArgumentError.new() if (slice <= 0 or slice > @series.length)
    (@series.length - slice + 1).times.map { |n| @series.drop(n).take(slice).join }
  end
end