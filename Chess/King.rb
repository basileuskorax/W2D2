class King < Piece
  include SteppingPiece

  def initialize(color, pos, board)
    super
    if color == :white
      @symbol = "\u2654"
    else
      @symbol = "\u265A"
    end
  end

  protected

  def move_diffs
    [[0, 1], [1, 0], [0, -1], [-1, 0], [1, 1], [-1, 1], [-1, -1], [1, -1]]
  end
end
