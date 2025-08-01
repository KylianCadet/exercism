class SecretHandshake
  ACTIONS = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(number)
    @number = number
  end

  def commands
    return [] if @number.to_s =~ /[^\d]/

    actions = @number
      .to_s(2)
      .rjust(5, '0')
      .reverse
      .chars
      .each_with_index
      .inject ([]) {|acc, (v, index)|
        next acc if v == '0'
        acc << ACTIONS[index]
      }
    return actions.compact.reverse if actions.include? nil
    actions
  end
end