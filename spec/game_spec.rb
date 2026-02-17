require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double('player', name: 'Bosse', marker: 'X') }
  let(:player_2) { double('player', name: 'Paul', marker: 'O') }

  describe '#game_over?' do
    context 'when there is a winner' do
      before do
        allow(game.board).to receive(:winner?).and_return(true)
      end

      it 'returns true from #winner?' do
        expect(game.game_over?).to eq(true)
      end
    end

    context 'when the board is full' do
      before do
        allow(game.board).to receive(:winner?).and_return(false)
        allow(game.board).to receive(:full?).and_return(true)
      end

      it 'returns true from #full?' do
        expect(game.game_over?).to eq(true)
      end
    end
  end

  describe '#announce_result' do
    context 'when there is a winner' do
      before do
        allow(game.board).to receive(:winner?).and_return(true)
      end

      it 'outputs Bosse wins!\n' do
        expect { game.announce_result }.to output("\nBosse wins!\n").to_stdout
      end
    end

    context 'when there is no winner' do
      before do
        allow(game.board).to receive(:winner?).and_return(false)
      end

      it "outputs It's a draw!" do
        expect { game.announce_result }.to output("\nIt's a draw!\n").to_stdout
      end
    end
  end

  describe '#switch_player' do
    context 'when Player 1 put down a marker' do
      it 'switches to Player 2' do
        game.switch_player
        expect(game.instance_variable_get(:@current_player)).to eq(player_2)
      end
    end

    context 'when Player 2 put down a marker' do
      it 'switches to Player 1' do
        game.switch_player
        game.switch_player
        expect(game.instance_variable_get(:@current_player)).to eq(player_1)
      end
    end
  end

  describe '#take_turn' do
    before do
      allow(game).to receive(:get_valid_position).and_return(1)
    end
    it 'makes a valid move' do
      expect(game.board).to receive(:update_position).with(1, 'X')
      game.take_turn
    end
  end
end
