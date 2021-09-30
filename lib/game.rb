# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

class Game
  attr_reader :board

  def initialize
    @player1 = Player.new('Player 1', 'red')
    @player2 = Player.new('Player 2', 'light_yellow')
    @board = Board.new
    @winning_player = nil
  end

  def play
    puts "Lets play connect four. Would you like to play against a human or a computer?"
    puts "[1 for human. 2 for computer]"
    choice = gets.chomp
    until choice == '1' || choice == '2'
      puts "Please choose 1 or 2"
      choice = gets.chomp
    end
    if choice == '1'
      play_human
    else
      play_computer
    end
  end

  def play_human
    loop do
      board.display_board
      choice1 = player_move(@player1)
      break if game_over?(board.push_disc(choice1, @player1), @player1)

      board.display_board
      choice2 = player_move(@player2)
      break if game_over?(board.push_disc(choice2, @player2), @player2)
    end
    game_end
  end

  def play_computer
    loop do
      board.display_board
      choice1 = player_move(@player1)
      break if game_over?(board.push_disc(choice1, @player1), @player1)

      board.display_board
      choice2 = computer_move(@player2)
      break if game_over?(board.push_disc(choice2, @player2), @player2)
    end
    game_end
  end

  def player_move(player)
    puts "#{player.name}, please choose a column to drop a disc"
    choice = player.player_turn
    loop do
      break if @board.column_not_full?(choice)

      puts 'That column is filled, try again.'
      choice = player.player_turn
    end
    choice
  end

  def computer_move(player)
    choice = player.computer_turn
    loop do
      break if @board.column_not_full?(choice)

      choice = player.computer_turn
    end
    choice
  end

  def game_over?(arr, player)
    if board.check_winner(arr)
      @winning_player = player
      true
    else
      false
    end
  end

  def game_end
    puts "#{@winning_player.name} won the game."
    puts "Would you like to play again? [Y/N]"
    choice = gets.chomp
    if choice == 'y'
      reset_game
    else
      puts "Thanks for playing!"
    end
  end

  private

  def reset_game
    @board = Board.new
    play
  end
end
