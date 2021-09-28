# frozen_string_literal: true
require 'pry-byebug'
require_relative 'display'
require 'colorize'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) { Array.new(6) }
  end

  def push_disc(column, player)
    # binding.pry
    board[column].each_index { |index|
      if board[column][index].nil?
        board[column][index] = player
        break
      end
    }
    # board[column][1] = player
  end

  def print_board
    print Display::TOP_LINE
    5.downto(0) do |i|
      print Display::VERTICAL_LINE
      0.upto(6) do |n|
        if board[n][i].nil?
          print " #{Display::EMPTY_CELL} #{Display::VERTICAL_LINE}"
        else
          # binding.pry
          print " #{Display::FILLED_CELL.colorize(board[n][i].color.to_sym)} #{Display::VERTICAL_LINE}"
        end
      end
      puts "\n"
    end
    print Display::BOTTOM_LINE
    print "#{Display::COLUMN_NUMBERS}\n"
  end
end

# puts "test".colorize(:red)