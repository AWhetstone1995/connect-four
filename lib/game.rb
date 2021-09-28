# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  attr_reader :board

  def initialize
    @player1 = Player.new('X', 'Player 1', 'red')
    @player2 = Player.new('O', 'Player 2', 'light_yellow')
    @board = Board.new
  end

  def round
    board.print_board
    board.push_disc(0, @player1)
    board.push_disc(1, @player1)
    board.print_board
  end
end


