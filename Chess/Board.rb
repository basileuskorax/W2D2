require 'byebug'
require_relative 'Piece'

class NoPieceError < StandardError
end

class InvalidMoveError < StandardError
end

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8){Array.new(8)}
    setup(self.grid)
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    raise NoPieceError.new "There is no piece here!" if self[start_pos].is_a?(NullPiece)
    raise InvalidMoveError.new "You can't move there!" unless valid_move?(end_pos)

    self[end_pos] = self[start_pos]
    # self[end_pos].pos = end_pos
    self[start_pos] = NullPiece.new
  end


  def valid_pos?(pos)
    return false unless (0..7).include?(pos[0]) && (0..7).include?(pos[1])
    true
  end

  def over?
    false
  end

  private
  def valid_move?(pos)
    return false unless (0..7).include?(pos[0]) && (0..7).include?(pos[1])
    return false unless self[pos].is_a?(NullPiece) && !self[pos].is_a?(Piece)

    true
  end

  def setup(grid)
    grid[2..5].map! do |row|
      row.map! do |col|
        col = NullPiece.new
      end
    end

    grid[0].each_index do |file|
      if file == 0 || file == 7
        grid[0][file] = Rook.new(:black, [0, file], self)
      elsif file == 1 || file == 6
        grid[0][file] = Knight.new(:black, [0, file], self)
      elsif file == 2 || file == 5
        grid[0][file] = Bishop.new(:black, [0, file], self)
      elsif file == 3
        grid[0][file] = King.new(:black, [0, file], self)
      else
        grid[0][file] = Queen.new(:black, [0, file], self)
      end
    end
    grid[1].each_index {|file| grid[1][file] = Pawn.new(:black, [1, file], self)}

    grid[6].each_index {|file| grid[6][file] = Pawn.new(:white, [6, file], self)}
    grid[7].each_index do |file|
      if file == 0 || file == 7
        grid[7][file] = Rook.new(:white, [7, file], self)
      elsif file == 1 || file == 6
        grid[7][file] = Knight.new(:white, [7, file], self)
      elsif file == 2 || file == 5
        grid[7][file] = Bishop.new(:white, [7, file], self)
      elsif file == 3
        grid[7][file] = Queen.new(:white, [7, file], self)
      else
        grid[7][file] = King.new(:white, [7, file], self)
    end

    # grid[0][0], grid[0][7] = Rook.new, Rook.new
    # grid[0][1], grid[0][6] = Knight.new, Knight.new
    # grid[0][2], grid[0][5] = Bishop.new, Bishop.new
    # grid[0][3], grid[0][4] = King.new, Queen.new
    # grid[7][0], grid[7][7] = Rook.new, Rook.new
    # grid[7][1], grid[7][6] = Knight.new, Knight.new
    # grid[7][2], grid[7][5] = Bishop.new, Bishop.new
    # grid[7][3], grid[7][4] = Queen.new, King.new

  end

end
