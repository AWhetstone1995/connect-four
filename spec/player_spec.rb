# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  describe '#verify_input' do
    context 'When player chooses a column' do
      subject(:player_input) { described_class.new('X', 'Player 1') }
      it 'Returns a number between 0-6' do
        user_input = '3'
        verified_input = player_input.verify_input(user_input)
        expect(verified_input).to eq(user_input.to_i)
      end

      it 'Returns nil if outside 0-6' do
        user_input = '7'
        verified_input = player_input.verify_input(user_input)
        expect(verified_input).to be_nil
      end
    end

    context 'When player inputs an invalid number once, followed by a valid number' do
      subject(:player_input) { described_class.new('X', 'Player 1') }
      before do
        invalid_input = '12'
        valid_input = '3'
        allow(player_input).to receive(:gets).and_return(invalid_input, valid_input)
      end

      it 'Completes loop and returns error message once' do
        error_message = 'Error, please choose a number between 0 and 6'
        expect(player_input).to receive(:puts).with(error_message).once
        player_input.player_turn
      end
    end
  end
end
