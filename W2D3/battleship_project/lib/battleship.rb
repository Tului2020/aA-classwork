require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(num)
        @player = Player.new
        @board = Board.new(num)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        puts @board.print
    end

    def lose?
        (@remaining_misses > 0)? (return false) : (p "you lose")
        return true
    end

    def win?
        (@board.num_ships != 0)? (return false) : (p "you win")
        return true
    end

    def game_over?
        win? || lose?
    end
    
    def turn
        attack_position = @player.get_move
        @remaining_misses -= 1 if !@board.attack(attack_position)
        @board.print
        puts @remaining_misses
    end
end
