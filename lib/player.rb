# frozen_string_literal: true

class Player
  attr_reader :name, :color

  def initialize(name, color = nil)
    @name = name
    @color = color
  end

  def player_turn
    number = gets.chomp
    until verify_input(number)
      puts 'Error, please choose a number between 0 and 6'
      number = gets.chomp
    end
    number.to_i
  end

  def computer_turn
    rand(0..6)
  end

  def verify_input(number)
    return number.to_i if number.match?(/^[0-6]$/)
  end
end
