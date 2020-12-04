class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(passed_node)
        @parent = passed_node
        @parent.children << self if !@parent.children.include?(self)
        
        # @children << @parent 
        # node.children

    end



end



#            Node 1
#     Node 2        Node 3


