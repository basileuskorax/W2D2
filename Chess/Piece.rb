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
    pos = val #NB NEED TO PUT A VALUE HERE
  end

end

module SlidingPiece
  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    possible = []
    if self.move_dirs.include?(:horizontal)
      horizontal_dirs.each do |dir|
        possible += grow_unblocked_moves_in_dir(dir[0], dir[1])
      end
    end
    if self.move_dirs.include?(:diagonal)
      diagonal_dirs.each do |dir|
        possible += grow_unblocked_moves_in_dir(dir[0], dir[1])
      end
    end
    possible
  end

  private
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [-1, 1], [1, -1]]

  def grow_unblocked_moves_in_dir(dx, dy)
    dir_array = []
    xplace = dx + pos[0]
    yplace = dy + pos[1]
    while valid_move?([xplace, yplace])
      dir_array << [xplace, yplace]
      break if board[xplace, yplace] != NullPiece.instance
      xplace += dx
      yplace += dy
    end
    dir_array
  end
end

module SteppingPiece
  def moves
    diff = []

    move_diffs.each do |mov|
      x = mov[0] + pos[0]
      y = mov[1] + pos[1]
      next unless valid_move?([x, y])
      diff << [x, y]
    end
    diff
  end
end
