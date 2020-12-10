module Slideable
  DIAGONAL_DIRS = [ [1, 1], [1, -1], [-1, -1], [-1, 1] ] 
  HORIZONTAL_DIRS = [ [1, 0], [0, 1], [-1, 0], [0, -1] ]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  #for each direction available to a piece
  #generate all possible move locations on the board. 
  def moves
    move_dirs.map {|dir| grow_unblocked_moves_in_dir(dir[0], dir[1]) }
  end

  #move_dirs is overwritten by piece subclass 
  #It will be updated with which directions each piece can move
  #horizontally or diagonally or both. 
  private
  def move_dirs
    diagonal_dirs + horizontal_dirs
  end

  #generates an array of all potential moves in a single direction
  private
  def grow_unblocked_moves_in_dir(dx,dy)
    potential_moves = []
    
    new_pos = self.pos
    r, c = new_pos
    r += dx
    c += dy
    while r >= 0 && r <= 7 && c >= 0 && c <= 7
      potential_moves << [r, c]
      r += dx
      c += dy
    end
    potential_moves
  end
end



module Stepable

  def moves
    move_diffs.map{ |e| [e[0] + self.pos[0], e[1] + self.pos[1]] }
  end

  private
  def move_diffs
    [[1,0], [2,1]]
  end

end

# p moves.length





