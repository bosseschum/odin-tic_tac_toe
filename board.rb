class Board
  attr_accessor :board

  def initialize
    @board = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9]
    ]
  end

  def display
    board
  end

  def update_position(position, marker)
    board[position] = marker
  end

  def valid_move?(position)
    return if board[position] == (1..9)

    puts 'That position is already taken!'
  end

  def winner?
  end
end
