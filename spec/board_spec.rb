require_relative '../lib/board'
require_relative '../lib/game'

describe Board do
  subject(:game) { described_class.new }

  describe '#winner?' do
    context 'when three same markers are in a row' do
      it 'returns true' do
        game.update_position(1, 'X')
        game.update_position(2, 'X')
        game.update_position(3, 'X')
        expect(game.winner?).to eq(true)
      end
    end

    context 'when no three same markers are in a row' do
      it 'returns false' do
        expect(game.winner?).to eq(false)
      end
    end

    context 'when the board is full and no three same markers are in a row' do
      it 'returns false' do
        game.board = %w[X O X X O X O X O]
        expect(game.winner?).to eq(false)
      end
    end
  end

  describe '#update_position' do
    it 'sets the current players marker at the chosen posititon' do
      game.update_position(5, 'X')
      expect(game.board[4]).to eq('X')
    end
  end

  describe '#valid_move?' do
    context 'when the chosen position was not taken' do
      it 'returns true' do
        expect(game.valid_move?(1)).to eq(true)
      end
    end

    context 'when the chosen position is already taken' do
      it 'returns false' do
        game.board[0] = 'X'
        expect(game.valid_move?(1)).to eq(false)
      end
    end

    context 'when the chosen position is out of range' do
      it 'returns false' do
        expect(game.valid_move?(10)).to eq(false)
      end
    end

    context 'when the chosen position is not an integer' do
      it 'returns false' do
        expect(game.valid_move?('a')).to eq(false)
      end
    end
  end
end
