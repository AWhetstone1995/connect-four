# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/player'

require 'pry-byebug'

describe Board do
  describe "#push_disc" do
    context "When player chooses column" do
      subject(:board_disc) { described_class.new }
      let(:player1) { Player.new('P1') }
      let(:player2) { Player.new('P2') }

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

  describe "#column_full?" do
    subject(:board_valid) { described_class.new }
    it "Returns true when column contains a nil" do
      expect(board_valid.column_full?(0)).to eq(true)
    end

    context "When column is full" do
      let(:player1) { Player.new('P1') }

      before do
        6.times do
          board_valid.push_disc(0, player1)
        end
      end

      it "Returns nil" do
        expect(board_valid.column_full?(0)).to eq(false)
      end
    end
  end

  describe "#check_winner" do
    subject(:board_winner) { described_class.new }
    let(:player1) { Player.new('P1') }
    let(:player2) { Player.new('P1') }

    context "When column does not have 4 in a row" do
      it "Returns false" do
        result = board_winner.check_winner(board_winner.push_disc(0, player1))
        expect(result).to eq(false)
      end
    end

    context "When column does have 4 in a row" do
      before do
        3.times do
          board_winner.push_disc(0, player1)
        end
      end

      it "Returns true" do
        result = board_winner.check_winner(board_winner.push_disc(0, player1))
        expect(result).to eq(true)
      end
    end

    context "When row does not have 4 in a row" do
      it "Returns false" do
        result = board_winner.check_winner(board_winner.push_disc(0, player1))
        expect(result).to eq(false)
      end
    end

    context "When row does have 4 in a row" do
      before do
        board_winner.push_disc(0, player1)
        board_winner.push_disc(1, player1)
        board_winner.push_disc(2, player1)
      end

      it "Returns true when row does have 4 in a row" do
        result = board_winner.check_winner(board_winner.push_disc(3, player1))
        expect(result).to eq(true)
      end
    end

    context "When board has a diagonal match of 4" do
      before do
        board_winner.push_disc(0, player1)
        board_winner.push_disc(1, player2)
        board_winner.push_disc(1, player1)
        board_winner.push_disc(2, player2)
        board_winner.push_disc(2, player2)
        board_winner.push_disc(2, player1)
        board_winner.push_disc(3, player2)
        board_winner.push_disc(3, player2)
        board_winner.push_disc(3, player2)
      end

      it "Returns true" do
        result = board_winner.check_winner(board_winner.push_disc(3, player1))
        expect(result).to eq(true)
      end
    end
  end
end
