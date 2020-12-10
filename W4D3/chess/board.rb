require 'singleton'
require_relative 'piece.rb'

class Board
    def initialize
        
        null_piece = NullPiece.instance
        @rows = Array.new(8) {Array.new(8,null_piece)}
        setup
    end

    def move_piece(start_pos, end_pos)
        raise "No Piece at #{start_pos}" if @rows[start_pos[0]][start_pos[1]] == null_piece
        raise "Piece cannot move to #{end_pos}" unless valid_pos?(end_pos)

        @rows[end_pos[0]][end_pos[1]] = @rows[start_pos[0]][start_pos[1]].dup
        @rows[start_pos[0]][start_pos[1]] = null_piece
    end

    # ---------------------------------------------------- #
    # need to refactor later
    def valid_pos?(pos)
        if pos[0] > 7 || pos[1] > 7
            return false
        end
        if pos[0] < 0 || pos[1] < 0
            return false
        end
        true
    end


    def [](pos)
        r, c = pos
        @rows[r][c]
    end

    def []=(pos, val)
        r, c = pos
        @rows[r][c] = val
    end


    #put piece placeholders in their starting positions
    def setup
        (0..1).each do |i| 
            @rows[i].map! { |j| Piece.new("white", nil, nil)}
            @rows[-1-i].map! { |j| Piece.new("black", nil, nil)}
        end
    end

    def print
        @rows.each { |r| puts r.to_s}
    end


    private 
    attr_reader :null_piece
end

b = Board.new
# b.print
# puts
# b.move_piece([0, 0], [2, 2])
# b.print
# p b[[0, 0]] = "F"
