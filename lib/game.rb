# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require 'pry-byebug'

class Game
  attr_reader :board

  def initialize
    @player1 = Player.new('Player 1', 'red')
    @player2 = Player.new('Player 2', 'light_yellow')
    @board = Board.new
  end

  def round
    loop do
      board.display_board
      choice1 = player_move(@player1)
      board.push_disc(choice1, @player1)
      break if game_over?

      board.display_board
      choice2 = player_move(@player2)
      board.push_disc(choice2, @player2)
      break if game_over?
    end
  end

  def player_move(player)
    puts "#{player.name}, please choose a column to drop a disc"
    choice = player.player_turn
    loop do
      break if @board.column_full?(choice)

      puts 'That column is filled, try again.'
      choice = player.player_turn
    end
    choice
  end

  def game_over?
    board.check_winner
    # binding.pry
  end
end
