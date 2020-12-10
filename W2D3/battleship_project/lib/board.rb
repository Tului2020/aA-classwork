class Board
    attr_reader :size


    def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(arr, value)
        @grid[arr[0]][arr[1]] = value
    end


    def num_ships
        @grid.flatten.count { |location| location == :S}
    end

    def attack(arr)
        if self[arr] == :S
            self[arr] = :H
            p "you sunk my battleship!"
            return true
        else
            self[arr] = :X
            return false
        end
    end

    def place_random_ships
        i = 0
        until i >= @size / 4
            x, y = rand(@grid.length), rand(@grid.length)
            if self[[x, y]] == :N
                self[[x, y]] = :S
                i += 1
            end
        end
    end

    def hidden_ships_grid
        hidden_ships = Array.new(@grid.length) {Array.new(@grid.length, :N)}
        [*0...@grid.length].each do |i|
            [*0...@grid.length].each do |j|
                hidden_ships[i][j] = @grid[i][j] if @grid[i][j] != :S
            end
        end
        hidden_ships
    end

    def self.print_grid(grid)
        grid.each { |row| puts row.join(" ")}
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end


end
