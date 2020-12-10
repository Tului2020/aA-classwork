require_relative "Node"


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
        @board = create_board
        @starting_pos = position
    end



    # def find_path(end_position)
        # # must include Array to node connection when jumping
        # # Node.children contain arrays not objects 



    # end


end












# KnightPathFinder.create_board.each do |row|
#     # row.each {|el| p el}
#     # row.each {|el| p el }#[el.value] + el.children}
#     row.each {|el| p el}
#     print "\n"
# end


board = KnightPathFinder.create_board
random_children = board[0][0].children
random_child_value = random_children[0]


p board[random_child_value[0]][random_child_value[1]]






# p KnightPathFinder.create_board

# assessment monday

# sort problem
# recursion problem
# my_something
# algorithm







