# frozen_string_literal: true
require 'pry-byebug'

class Player
  attr_accessor :name, :marker
  attr_reader :number

  def initialize(marker, name)
    @marker = marker
    @name = name
  end

  def player_turn
    puts "#{name}, please choose a column to drop a disc"
    puts 'Invalid choice, please choose a column number between 0 and 6' until verify_input(gets.chomp)
  end

  def verify_input(number)
    return number.to_i if number.match?(/^[0-6]$/)
  end
end

# player = Player.new('x', 'p1')
# player.player_turn