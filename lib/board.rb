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

  private

  def check_horizontal

  end

  def check_vertical

  end

  def check_diagonal

  end
end
