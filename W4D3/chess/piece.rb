
require 'singleton'
class Piece

    attr_reader :color
    def initialize(color, board, pos)
        @board = board
        @pos = pos
        @color = color
    end

    def inspect
        "piece"
    end

    #returns an array of places a Piece can move to. 
    #each Piece will implement it's own moves method 
    #unique to how each piece moves. 
    def moves

    end

    def to_s

    end

    #
    def valid_moves

        moves.map do |move|
            cutoff = true
            ret = []
            move.each do |pos|       
                cutoff = false if @board[pos].color != nil
                ret << pos if cutoff 
            end
            if ret.length == move.length
                ret
            else
                pos = move[ret.length]
                ret << pos if @color != @board[pos].color
            end
        end
    end




    def empty?

    end

    def pos=(value)

    end

    private
    def move_into_check?(end_pos)

    end

    
end


class NullPiece < Piece
    include Singleton

    attr_reader :color, :symbol

    def initialize
        @color = nil
        @symbol = nil
    end

    def inspect 
        "NULL"
    end

end

