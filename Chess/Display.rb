require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  attr_reader :cursor, :board

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def move_cursor
    until board.over?
      render
      cursor.get_input
    end
  end

  def render
    system('clear')

    row = 0
    while row < 8
      col = 0
      while col < 8
        if [row, col] == cursor.cursor_pos
          cur = board[[row, col]].symbol.colorize(:background => :blue)
          print cur
        else
        print board[[row, col]].symbol
        end
        col += 1
      end
        row += 1
    end



  end
end
