require 'date'

class Meetup
  WEEKDAYS = %i[monday tuesday wednesday thursday friday saturday sunday]

  def initialize(month, year)
    @year = year
    @month = month
  end

  def day(weekday, descriptor)
    case descriptor
    when :teenth
      get_teenth(weekday)
    when :first
      get_nth(weekday, 1)
    when :second
      get_nth(weekday, 2)
    when :third
      get_nth(weekday, 3)
    when :fourth
      get_nth(weekday, 4)
    when :last
      get_last(weekday)
    end
  end

  private
  def get_nth(weekday, n)
    date = Date.new(@year, @month)
    date = date.next while WEEKDAYS[date.wday - 1] != weekday
    (1...n).each do
      date = date.next_day(7)
    end
    date
  end

  def get_teenth(weekday)
    date = Date.new(@year, @month)
    date = date.next while WEEKDAYS[date.wday - 1] != weekday || !date.day.between?(13, 19)
    date
  end

  def get_last(weekday)
    date = Date.new(@year, @month, -1)
    date = date.prev_day(1) while WEEKDAYS[date.wday - 1] != weekday
    date
  end
end