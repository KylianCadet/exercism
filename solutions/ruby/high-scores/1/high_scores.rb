class HighScores
  attr_reader :scores

  def initialize(scores)
      @scores = scores
  end

  def latest
    @scores.at(-1)
  end

  def personal_best
    @scores.max
  end

  def personal_top_three
    @scores.sort.reverse[0..2]
  end

  def latest_is_personal_best?
    latest == personal_best
  end
end