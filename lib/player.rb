# frozen_string_literal: true

require 'colorize'

class Player
  attr_accessor :name, :marker
  attr_reader :number, :color

  def initialize(name, color = nil)
    @name = name
    @color = color
  end

  def player_turn
    puts "#{name}, please choose a column to drop a disc"
    number = gets.chomp
    until verify_input(number)
      puts 'Error, please choose a number between 0 and 6' 
      number = gets.chomp
    end
    number.to_i
  end

  def verify_input(number)
    return number.to_i if number.match?(/^[0-6]$/)
  end
end
