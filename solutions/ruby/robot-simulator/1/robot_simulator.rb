class Robot
  DIRECTIONS = [:north, :east, :south, :west]
  MOVEMENTS = {
    :north => {:x => 0, :y => 1},
    :east => {:x => 1, :y => 0},
    :south => {:x => 0, :y => -1},
    :west => {:x => -1, :y => 0}
  }

  def initialize
    @direction = :north
    @px = 0
    @py = 0
  end

  def orient(direction)
    raise ArgumentError.new("Unknown direction: #{direction}") unless DIRECTIONS.include?(direction)
    @direction = direction
  end

  def bearing
    @direction
  end

  def turn_right
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) + 1) % DIRECTIONS.length]
  end

  def turn_left
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) - 1) % DIRECTIONS.length]
  end

  def at(x, y)
    @px = x
    @py = y
  end

  def coordinates
    [@px, @py]
  end

  def advance
    movement = MOVEMENTS[bearing]
    @px += movement[:x]
    @py += movement[:y]
  end
end

class Simulator
  COMMANDS = {
    'L' => :turn_left,
    'R' => :turn_right,
    'A' => :advance
  }

  def initialize
    
  end

  def instructions(str_instruction)
    str_instruction.chars.map{|c| COMMANDS[c]}
  end

  def place(robot, x:, y:, direction:)
    robot.orient(direction)
    robot.at(x, y)
  end

  def evaluate(robot, str_instruction)
    instructions(str_instruction).each {|instruction|
      case instruction
      when :turn_left
        robot.turn_left
      when :turn_right
        robot.turn_right
      when :advance
        robot.advance
      end
    }
  end
end