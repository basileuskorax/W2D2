class Rook < Piece
  include SlidingPiece

  def initialize(color, pos, board)
    super
    if color == :white
      @symbol = "\u2655"
    else
      @symbol = "\u265C"
    end
  end

  protected

  def move_dirs
    [:horizontal]
  end
end
