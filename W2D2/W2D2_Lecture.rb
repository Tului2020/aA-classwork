# class Queue
#     def initialize
#       @line = []
#     end
  
#     def [](position)
#       @line[position]
#     end
  
#     def add(ele)
#       @line << ele # add ele to back of line
#       nil
#     end
  
#     def remove
#       @line.shift  # remove front ele of line
#     end
#   end
  
#   grocery_checkout = Queue.new
#   grocery_checkout.add("Alan")
#   grocery_checkout.add("Alonzo")
  
#   # Calling Queue#[] without any syntactic sugar is ugly:
#   p grocery_checkout.[](0)          # "Alan"
#   grocery_checkout.[](1)          # "Alonzo"
  
#   # With syntactic sugar, it's waaaaay better:
#   p grocery_checkout[0]             # "Alan"
#   grocery_checkout[1]             # "Alonzo"



class Board
    def initialize
        @grid = Array.new(3) {Array.new(3)}
        populate
    end

    def populate
        @grid.each.with_index do |row, idx1|
            row.each.with_index do |piece, idx2|
                @grid[idx1][idx2] = [:x, :o].sample
            end
        end
    end

    def [](a, b)
        @grid[a][b]
    end

    def []=(position, val)
        @grid[position[0]][position[1]] = val
    end
end


board = Board.new
p board

piece1 = board[0, 1]
p piece1
