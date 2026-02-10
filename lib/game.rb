class Game
  attr_reader :board, :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @board = Board.new
    @current_player = player_1
  end

  def play
    puts 'Welcome to Tic-Tac-Toe!'
    puts "#{player_1.name} is #{player_1.marker}, #{player_2.name} is #{player_2.marker}."
    puts

    until game_over?
      board.display
      puts
      take_turn
      switch_player unless game_over?
    end

    board.display
    announce_result
  end

  def take_turn
    puts "#{@current_player.name}'s turn (#{@current_player.marker})"
    position = get_valid_position
    board.update_position(position, @current_player.marker)
  end

  def get_valid_position
    loop do
      print 'Enter position (1-9): '
      position = gets.chomp.to_i
      return position if board.valid_move?(position)

      puts 'Invalid move! Try again.'
    end
  end

  def switch_player
    @current_player = @current_player == player_1 ? player_2 : player_1
  end

  def game_over?
    board.winner? || board.full?
  end

  def announce_result
    puts
    if board.winner?
      puts "#{@current_player.name} wins!"
    else
      puts "It's a draw!"
    end
  end
end
