class WordProblem
  OPERATIONS = {
    'plus' => -> (a, b) {a + b},
    'minus' => -> (a, b) {a - b},
    'multiplied by' => -> (a, b) {a * b},
    'divided by' => -> (a, b) {a / b}
  }.freeze

  def initialize(sentence)
    @sentence = sentence
  end
  
  def answer
    raise ArgumentError.new unless @sentence =~ /^What is (-?\d+) (?>(plus|minus|multiplied by|divided by) (-?\d+)\s?)+\?$/

    tokens = @sentence
      .scan(/-?\d+ (?>plus|minus|multiplied by|divided by)/)
      .to_a
      .map(&:split)
      .map{|number, *operator|
        [number.to_i, operator.join(' ')]
      }
      .push(@sentence.scan(/(-?\d+)\?/).at(0).at(0).to_i)
      .flatten

    res = 0
    while tokens.length != 1
      n1,operator,n2 = tokens.shift(3)
      res = OPERATIONS[operator].call(n1, n2)
      tokens.insert(0, res)
    end
    res
  end
end