# frozen_string_literal: true

require 'colorize'

class Player
  attr_accessor :name, :marker
  attr_reader :number, :color

  def initialize(marker, name, color)
    @marker = marker
    @name = name
    @color = color
  end

  def player_turn
    puts "#{name}, please choose a column to drop a disc"
    puts 'Error, please choose a number between 0 and 6' until verify_input(gets.chomp)
  end

  def verify_input(number)
    return number.to_i if number.match?(/^[0-6]$/)
  end
end

# test1 = Player.new('x','p1','light_yellow')

# puts 'test'.colorize(test1.color.to_sym)