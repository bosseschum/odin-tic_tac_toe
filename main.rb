require_relative './lib/player'
require_relative './lib/board'
require_relative './lib/game'

puts 'Who is Player 1?'
player1 = Player.new(gets.chomp, 'X')

puts 'Who is Player 2?'
player2 = Player.new(gets.chomp, 'O')

game = Game.new(player1, player2)
game.play
