class Piece
  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  attr_reader :color, :symbol, :pos
  attr_accessor :board

  def empty?
    self.is_a?(NullPiece)
  end

  def to_s
    self.class.to_s
  end

  def valid_move?(pos)
    (0..7).include?(pos[0]) && (0..7).include?(pos[1]) && board[pos].color != color
  end

  def pos=(val)
    pos = #NB NEED TO PUT A VALUE HERE
  end

end
