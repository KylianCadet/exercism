module Tournament
  HEADER_NAME_SIZE = 31
  HEADER = "#{'Team'.ljust(HEADER_NAME_SIZE)}| MP |  W |  D |  L |  P"
  WIN = 'win'
  LOSS = 'loss'
  DRAW = 'draw'
  DELIMITER = ';'

  def self.tally(input)
    results = input.strip.lines.reduce({}) { |acc, line|
      team1, team2, result = line.strip.split(DELIMITER)
      if result == LOSS
        team1, team2 = team2, team1
      end
      acc[team1] = update_team_result(team1, acc[team1], result == LOSS ? WIN : result)
      acc[team2] = update_team_result(team1, acc[team2], result == WIN ? LOSS : result)
      acc
    }

    if results.length == 0
      return <<~TALLY
      #{HEADER}
      TALLY
    end

    <<~TALLY
    #{HEADER}
    #{results
      .sort_by{|name, result| [-result[:p], name]}
      .map{|name, result| 
        <<~TALLY
        #{fmt_line(name, result)}
        TALLY
      }.join.strip}
    TALLY
  end

  private
  def self.fmt_line(name, result)
    "#{name.ljust(HEADER_NAME_SIZE)}|#{[result[:mp],result[:w],result[:d],result[:l],result[:p]].map(&:to_s).map{|s| s.rjust(3)}.join(' |') }"
  end

  def self.get_point(result)
    case result
    when WIN
      3
    when DRAW
      1
    when LOSS
      0
    end
  end

  def self.update_team_result(team_name, previous_results, result)
    previous_results ||= { :mp => 0, :w => 0, :d => 0, :l => 0, :p => 0}

    return {
      :mp => previous_results[:mp] + 1,
      :w => previous_results[:w] + (result == WIN ? 1 : 0),
      :d => previous_results[:d] + (result == DRAW ? 1 : 0),
      :l => previous_results[:l] + (result == LOSS ? 1 : 0),
      :p => previous_results[:p] + get_point(result),
    }
  end
end