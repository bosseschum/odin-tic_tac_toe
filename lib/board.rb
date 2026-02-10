class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display
    board.each_with_index do |item, index|
      print "#{item} "
      puts if (index + 1) % 3 == 0
    end
  end

  def update_position(position, marker)
    board[position - 1] = marker
  end

  def valid_move?(position)
    (1..9).include?(position) && board[position - 1].is_a?(Integer)
  end

  def winner?
    winning_combos = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

    winning_combos.any? do |combo|
      board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] &&
        board[combo[0]].is_a?(String)
    end
  end

  def full?
    board.all? { |cell| cell.is_a?(String) }
  end
end
