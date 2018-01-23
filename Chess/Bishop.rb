
class Bishop < Piece
  include SlidingPiece

  attr_reader :symbol

  def initialize(color, pos, board)
    super
    if color == :white
      @symbol = " \u2657 "
    else
      @symbol = " \u265D "
    end
  end

  protected

  def move_dirs
    [:diagonal]
  end
end
