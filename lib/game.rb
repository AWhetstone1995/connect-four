# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  attr_reader :board

  def initialize
    @player1 = Player.new('Player 1', 'red')
    @player2 = Player.new('Player 2', 'light_yellow')
    @board = Board.new
  end

  def round
    board.print_board
    board.push_disc(@player1.player_turn, @player1)
    board.print_board
    board.push_disc(@player2.player_turn, @player2)
    board.print_board
  end
end
