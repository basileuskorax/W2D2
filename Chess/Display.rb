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
    rank = ''
    grid = []
    while row < 8
      col = 0
      while col < 8
        if [row, col] == cursor.cursor_pos
          rank << board[[row, col]].symbol.colorize(:background => :light_yellow)
          col += 1
          next
        end
        if (row + col).even?
          rank << board[[row, col]].symbol.colorize(:background => :light_green)
        else
          rank << board[[row, col]].symbol.colorize(:background => :light_black)
        end
        col += 1
      end
        grid << rank
        rank = ''
        row += 1
    end
    grid.each {|el| puts el}

  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  d.move_cursor
end
