class Pawn < Piece

  def initialize(color, pos, board)
    super
    if color == :white
      @symbol = "\u2659"
    else
      @symbol = "\u265F"
    end
  end

  def move_dirs
    moves = []

    moves += fast_steps if at_start_row?

    moves += forward_steps
    moves += side_attacks

    moves
  end

private

  def at_start_row?
    if color == white
      pos[0] == 6
    else
      pos[0] == 1
    end
  end

  def fast_steps
    fast = [pos[0], pos[1] + 2]
    fast if valid_move?(fast)
  end

  def forward_steps
    slow = [pos[0], pos[1] + 1]
    slow if valid_move?(slow)
  end

  def side_attacks
    sides = []

    right_atk = board[pos[0] + 1, pos[1] + 1]
    left_atk = board[pos[0] - 1, pos[1] + 1]

    if right_atk.color != nil && right_atk.color != color
      sides << right_atk
    end
    if left_atk.color != nil && left_atk.color != color
      sides << left_atk
    end

    sides
  end

end
