# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  attr_reader :board

  def initialize
    @player1 = Player.new('X', 'Player 1')
    @player2 = Player.new('O', 'Player 2')
    @board = Board.new
  end

  def round
    board.print_board
  end
end

# game = Game.new
# game.round
