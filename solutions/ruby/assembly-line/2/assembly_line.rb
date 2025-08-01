class AssemblyLine
  CAR_PROCUDED_PER_HOUR = 221

  SUCCES_RATE =
    (1..4).to_a.map {|n| [n, 100] }.to_h.merge!(
    (5..8).to_a.map { |n| [n, 90] }.to_h).merge!(
    Hash[
      9 => 80,
      10 => 77
    ])

  def initialize(speed)
    @speed = speed
  end

  def sucess_rate
    AssemblyLine::SUCCES_RATE[@speed]
  end

  def production_rate_per_hour
    (CAR_PROCUDED_PER_HOUR * @speed * sucess_rate).to_f / 100
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
