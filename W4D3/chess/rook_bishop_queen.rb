require_relative "piece.rb"
require_relative "modules.rb"
require 'singleton'
require_relative "board.rb"

class Bishop < Piece
  include Slideable

  attr_reader :symbol, :pos

 def initialize(color, board, pos)
    @symbol = :B
    super
  end

  private 
  def move_dirs
    diagonal_dirs
  end
end

# board = Board.new
# b = Bishop.new("black", board, [1, 1])
# p b.valid_moves


class Rook < Piece
  include Slideable
  attr_reader :symbol, :pos
  
 def initialize(color, board, pos)
    @symbol = :R
    super
  end

  private 
  def move_dirs
    horizontal_dirs
  end

end








class Queen < Piece
  include Slideable
  attr_reader :symbol, :pos

  def initialize(color, board, pos)
    @symbol = :Q
    super
  end
   
  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

end


