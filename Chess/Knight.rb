class Knight < Piece
  include SteppingPiece

  def initialize(color, pos, board)
    super
    if color == :white
      @symbol = "\u2658"
    else
      @symbol = "\u265E"
    end
  end

  protected

  def move_diffs
    [[1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [2, -1], [-1, 2], [-2, 1]]
  end
end
