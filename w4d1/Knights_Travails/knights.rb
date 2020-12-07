require_relative "Node"
require "byebug"

class KnightPathFinder

    

    def self.create_board
        # creates and populates the board with elements as nodes
        # board contains all nodes (populated using nested loop) 
        board = Array.new(8) { Array.new(0) }
        board.each_with_index do |row, idx| 
            (0...8).each do |jdx| 
                row << PolyTreeNode.new([idx, jdx])
            end
        end

        # creates connections between each cell and possible moves
        # this is a map for the knight to move around the board
        # each node contains "value" - value of position, "parent" - 
        # previous position, "children" - possible moves 
        board.each do |row|
            row.each do |knight|
                # uses possible moves to generate children
                # knight moves get a 2D array of possible moves
                
                self.knight_moves(knight.value).each { |move| knight.children << move }
                # self.knight_moves(knight.value).each { |move| knight.children << board[move[0]][move[1]] } <---- this code will 
                # create a infinite loop because its adding children of children which are your children and your parents.
            end
        end
    end


    # generates all possible moves
    def self.knight_moves(pos)
        possible_moves = [
            [1, 2],
            [1, -2],
            [2, 1],
            [2, -1],
            [-1, 2],
            [-1, -2],
            [-2, 1],
            [-2, -1]]

        moves = []
        possible_moves.each do |knight| 
            ret = [knight[0] + pos[0], knight[1] + pos[1]]
            moves << ret if 0 <= ret[0] && ret[0] <= 7 && 0 <= ret[1] && ret[1] <= 7
        end
        moves
    end



    def initialize(position)
        @board = KnightPathFinder.create_board
        @all_moves = [position]

    end






    def find_path(end_position, reset=true)
        # # must include Array to node connection when jumping
        # # Node.children contain arrays not objects 
        # # helper functions: find distance (end, start), add to all_moves
        # base case where we found path
        return @all_moves if end_position == @all_moves[-1]
        @all_moves = @all_moves[...1] if reset
        # @all_moves[0] = starting position i.e [0, 1] (array)
        current_position = @board[@all_moves[-1][0]][@all_moves[-1][1]]   # setting current position to object at the last position
        
        possible_moves = []
        possible_moves_distance = []
        
        current_position.children.each do |el|
            # debugger
            dst = find_distance(el, end_position)
            if dst == 1 || dst == 8 ** 0.5
                next
            else
                possible_moves << el
                possible_moves_distance << dst
            end
        end

        local_shortest_path = possible_moves[possible_moves_distance.index(possible_moves_distance.min)]
        add_to_steps(local_shortest_path)
        find_path(end_position, false)
    end

    def find_distance(start, dest)
        dx = start[0] - dest[0]
        dy = start[1] - dest[1]

        (dx ** 2 + dy ** 2) ** 0.5
    end

    def add_to_steps(pos)
        @all_moves << pos
    end
        



end


# p KnightPathFinder.find_distance([0, 3], [4, 0])


# board = KnightPathFinder.new([4, 1])
# p board.find_path([6, 1])#each {|row| p row}

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([2, 1]).length == [[0, 0], [2, 1]].length
p kpf.find_path([3, 3]).length == [[0, 0], [2, 1], [3, 3]].length
p kpf.find_path([7, 6]).length == [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]].length
p kpf.find_path([6, 2]).length == [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]].length


# board = KnightPathFinder.create_board
# board.each do |row|
#     # row.each {|el| p el}
#     # row.each {|el| p el }#[el.value] + el.children}
#     row.each {|el| print el.value }
#     print "\n"
# end
# p board[0][0]


# board = KnightPathFinder.create_board
# random_children = board[0][0].children
# random_child_value = random_children[0]


# p board[random_child_value[0]][random_child_value[1]]



# p KnightPathFinder.knight_moves([4, 4])




# p KnightPathFinder.create_board

# assessment monday

# sort problem
# recursion problem
# my_something
# algorithm







