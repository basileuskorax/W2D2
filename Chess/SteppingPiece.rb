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
