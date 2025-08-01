class LogLineParser
  def initialize(line)
    parsed_line = line.match /\[(?<log_level>[A-Z]+)\]: (?<message>[\w\s]+)/
    @log_level = parsed_line['log_level'].downcase
    @message = parsed_line['message'].strip
  end

  def message
    @message
  end

  def log_level
    @log_level
  end

  def reformat
    "#{@message} (#{@log_level})"
  end
end
