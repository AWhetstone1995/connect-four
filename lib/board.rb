# frozen_string_literal: true
require 'pry-byebug'
require_relative 'display'
require 'colorize'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) { Array.new(6) }
    # fill_initial_board
  end

  # def fill_initial_board
  #   binding.pry
  #   board.flatten.each do |index|
  #     board[index] = '.'
  #   end
  # end

  def print_board
    print Display::TOP_LINE
    0.upto(5) do |i|
      print Display::VERTICAL_LINE
      0.upto(6) do |n|
        if board[n][i].nil?
          print " #{Display::EMPTY_CELL} #{Display::VERTICAL_LINE}\n"
        else
          " #{board[n][i]} #{Display::VERTICAL_LINE}\n"
        end
      end
      puts "\n"
    end
    print Display::BOTTOM_LINE
  end
end

puts "test".colorize(:red)