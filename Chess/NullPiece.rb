class NullPiece
  include 'Singleton'

  def initialize
    @color = nil
    @symbol = ''
    @pos = []
    @board = nil
  end

  attr_reader :color, :symbol


  def moves

  end
end
