# frozen_string_literal: true

class Player
  attr_accessor :name, :marker
  attr_reader :number

  def initialize(marker, number)
    @marker = marker
    @number = number
    @name = build_player_name
  end

  private

  def build_player_name
    puts "Player #{number}, what is your name?"
    gets.chomp
  end
end
