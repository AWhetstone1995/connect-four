# frozen_string_literal: true
require_relative 'display'
# require_relative 'player'
# require 'colorize'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) { Array.new(6) }
  end

  # push disc into first nil slot on a given column
  def push_disc(column, player)
    board[column].each_index do |row|
      if board[column][row].nil?
        board[column][row] = player
        return [[column], [row]].flatten
      end
    end
  end

  def column_not_full?(column)
    return false unless board[column].include?(nil)

    true
  end

  def display_board
    print_board
  end

  def check_winner(arr)
    return true if check_horizontal_left(arr[0], arr[1])
    return true if check_horizontal_right(arr[0], arr[1])
    return true if check_vertical_up(arr[0], arr[1])
    return true if check_vertical_down(arr[0], arr[1])
    return true if check_diagonal_left(arr[0], arr[1])
    return true if check_diagonal_right(arr[0], arr[1])

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
          # print " #{Display::FILLED_CELL.colorize(board[n][i].color.to_sym)} #{Display::VERTICAL_LINE}"
          print " \e#{board[n][i].color}#{Display::FILLED_CELL}\e[m #{Display::VERTICAL_LINE}"
        end
      end
      puts "\n"
    end
    print Display::BOTTOM_LINE
    print "#{Display::COLUMN_NUMBERS}\n"
  end

  def check_horizontal_right(column, row)
    return false if column + 3 > 6
    if board[column][row] == board[column + 1][row] &&
       board[column + 1][row] == board[column + 2][row] &&
       board[column + 2][row] == board[column + 3][row]
      return true
    end

    false
  end

  def check_horizontal_left(column, row)
    return false if (column - 3).negative?
    if board[column][row] == board[column - 1][row] &&
       board[column - 1][row] == board[column - 2][row] &&
       board[column - 2][row] == board[column - 3][row]
      return true
    end

    false
  end

  def check_vertical_up(column, row)
    return false if row + 3 > 5
    if board[column][row] == board[column][row + 1] &&
       board[column][row + 1] == board[column][row + 2] &&
       board[column][row + 2] == board[column][row + 3]
      return true
    end

    false
  end

  def check_vertical_down(column, row)
    return false if (row - 3).negative?
    if board[column][row] == board[column][row - 1] &&
       board[column][row - 1] == board[column][row - 2] &&
       board[column][row - 2] == board[column][row - 3]
      return true
    end

    false
  end

  def check_diagonal_right(column, row)
    return false if column + 3 > 6
    return false if row + 3 > 5
    if board[column][row] == board[column + 1][row + 1] &&
       board[column + 1][row + 1] == board[column + 2][row + 2] &&
       board[column + 2][row + 2] == board[column + 3][row + 3]
      return true
    end

    false
  end

  def check_diagonal_left(column, row)
    return false if (column - 3).negative?
    return false if (row - 3).negative?
    if board[column][row] == board[column - 1][row + 1] &&
       board[column - 1][row + 1] == board[column - 2][row + 2] &&
       board[column - 2][row + 2] == board[column - 3][row + 3]
      return true
    end

    false
  end
end
