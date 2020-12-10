require_relative 'modules.rb'
require_relative 'piece.rb'

class King < Piece
  include Stepable

  def initialize(color, board, pos)
    @symbol = :K
    super
  end

  def move_diffs
    [ [1, 1], [1, -1], [-1, -1], [-1, 1], [1, 0], [0, 1], [-1, 0], [0, -1] ]
  end



end


class Knight < Piece
  include Stepable

  def initialize(color, board, pos)
    @symbol = :k
    super
  end

  def move_diffs
    [[2, 1], [-2, 1], [2, -1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end

end 


board = Board.new
king = King.new("black", n, nil)


# board = Board.new
# b = Bishop.new("black", board, [1, 1])
# p b.valid_moves