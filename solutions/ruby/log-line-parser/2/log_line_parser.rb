class LogLineParser
  attr_reader :message :log_level

  def initialize(line)
    parsed_line = line.match /\[(?<log_level>[A-Z]+)\]: (?<message>[\w\s]+)/
    @log_level = parsed_line['log_level'].downcase
    @message = parsed_line['message'].strip
  end

  def reformat
    "#{@message} (#{@log_level})"
  end
end
