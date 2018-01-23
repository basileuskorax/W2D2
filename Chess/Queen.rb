class Queen < Piece
  include SlidingPiece

  def initialize(color, pos, board)
    super
    if color == :white
      @symbol = "\u2655"
    else
      @symbol = "\u265B"
    end
  end

  protected

  def move_dirs
    [:horizontal, :diagonal]
  end
end
