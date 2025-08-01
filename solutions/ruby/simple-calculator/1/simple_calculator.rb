class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    if !ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation.new("UnsupportedOperation")
    end
    if [first_operand, second_operand].any?{|operand| !operand.instance_of? Integer}
      raise ArgumentError.new("Invalid argument")
    end

    begin
      result = case operation
      when '+'
        first_operand + second_operand
      when '/'
        first_operand / second_operand
      when '*'
        first_operand * second_operand
      end
    rescue ZeroDivisionError => e
      return 'Division by zero is not allowed.'
    end

    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end