class Board
  EMPTY = '.'
  PLAYER_O = 'O'
  PLAYER_X = 'X'
  BLOCKED = 'B'
  ADJACENT_SQUARES = [
    [-1, 1], # bottom right
    [-1, 0], # bottom
    [0, 1], # right
    [0, -1], # left
    [1, -1], # top left
    [1, 0] # top
  ]

  def initialize(board)
    @board = board.map(&:split)
  end

  def winner
    return PLAYER_O if connected?(PLAYER_O, @board)
    return PLAYER_X if connected?(PLAYER_X, @board.transpose)
    ''
  end

  private
  def connected?(player, board)
    board[0].each.with_index.any? {|square, index|
      walk(board.dup, player, 0, index) if square == player
    }
  end

  # walk though adjacente squares, return true if on the last row
  def walk(board, player, y, x)
    return true if y == board.length - 1
    board[y][x] = BLOCKED
    ADJACENT_SQUARES.any? {|ym, xm|
      next unless (ym + y).between?(0, board.length - 1)
      next unless (xm + x).between?(0, board[0].length - 1)
      walk(board, player, ym + y, xm + x) if board[ym + y][xm + x] == player
    }
  end
end
