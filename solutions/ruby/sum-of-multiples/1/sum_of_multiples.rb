class SumOfMultiples
  def initialize(*args)
    @args = args
  end

  def to(n)
    @args.map{|arg|
      arg == 0 ? 0 : (1..((n - 1) / arg).floor).map {|i| i * arg}
    }.flatten.uniq.sum
  end
end