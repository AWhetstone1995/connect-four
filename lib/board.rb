# frozen_string_literal: true

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) { Array.new(6) }
  end

  def print_board
    0.upto(5) do |i|
      print '|'
      0.upto(6) do |n|
        print board[n][i].nil? ? ' |' : " #{board[n][i]} |"
      end
      puts
    end
  end
end

# board = Board.new
# board.print_board