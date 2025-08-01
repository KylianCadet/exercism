class BirdCount
  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  def initialize(birds_per_day)
    @last_week = birds_per_day
  end

  def yesterday
    @last_week[-2]
  end

  def total
    @last_week.sum
  end

  def busy_days
    @last_week.filter{|day| day >= 5}.length
  end

  def day_without_birds?
    @last_week.any?{|day| day == 0}
  end
end
