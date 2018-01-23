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
