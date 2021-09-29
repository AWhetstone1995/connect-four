# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/player'

describe Board do
  describe "#push_disc" do
    context "When player chooses column" do
      subject(:board_disc) { described_class.new }
      let(:player1) { Player.new('P1') }
      let(:player2) { Player.new('P2')}

      it "Inserts disc into the right column" do
        player_input = 0
        board_disc.push_disc(player_input, player1)
        expect(board_disc.board[0][0]).to eq(player1)
      end

      it "Does not overwrite a cell in a column" do
        first_input = 0
        second_input = 0
        board_disc.push_disc(first_input, player1)
        board_disc.push_disc(second_input, player2)
        expect(board_disc.board[0][0]).to eq(player1)
      end
    end
  end
end
