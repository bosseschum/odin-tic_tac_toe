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

  def winner?; end
end
