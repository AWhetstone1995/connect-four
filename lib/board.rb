# frozen_string_literal: true
require 'pry-byebug'
require_relative 'display'
require 'colorize'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) { Array.new(6) }
  end

  # push disc into first nil slot on a given column
  def push_disc(column, player)
    board[column].each_index do |index|
      if board[column][index].nil?
        board[column][index] = player
        break
      end
    end
  end

  def column_full?(column)
    return false unless board[column].include?(nil)

    true
  end

  def display_board
    print_board
  end

  def check_winner
    return true if check_horizontal
    return true if check_vertical

    # check_diagonal
    false
  end

  private

  def print_board
    print Display::TOP_LINE
    5.downto(0) do |i|
      print Display::VERTICAL_LINE
      0.upto(6) do |n|
        if board[n][i].nil?
          print " #{Display::EMPTY_CELL} #{Display::VERTICAL_LINE}"
        else
          print " #{Display::FILLED_CELL.colorize(board[n][i].color.to_sym)} #{Display::VERTICAL_LINE}"
        end
      end
      puts "\n"
    end
    print Display::BOTTOM_LINE
    print "#{Display::COLUMN_NUMBERS}\n"
  end

  def check_horizontal
    result = false
    0.upto(5) do |row|
      next if count_empty_horizontal_cells(row) >= 4

      0.upto(3) do |column|
        if board[column][row] == board[column + 1][row] &&
           board[column + 1][row] == board[column + 2][row] &&
           board[column + 2][row] == board[column + 3][row]
          return true
        end
      end
    end
    result
  end

  def check_vertical
    result = false
    0.upto(6) do |column|
      next if count_empty_vertical_cells(column) >= 4

      0.upto(2) do |row|
        if board[column][row] == board[column][row + 1] &&
           board[column][row + 1] == board[column][row + 2] &&
           board[column][row + 2] == board[column][row + 3]
          return true
        end
      end
    end
    result
  end

  def check_diagonal

  end

  def count_empty_vertical_cells(column)
    board[column].count(&:nil?)
  end

  def count_empty_horizontal_cells(row)
    board.each.count { |column| column[row].nil? }
  end
end

# board = Board.new
# p board.check_winner