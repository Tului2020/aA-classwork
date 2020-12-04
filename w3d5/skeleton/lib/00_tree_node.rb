class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(passed_node)
        # @parent.children -= [self] if @parent != nil
        @parent = passed_node
        return nil if @parent == nil
        @parent.children << self if !@parent.children.include?(self)

    end

    def add_child(child)
        child.parent = self
        @children << child if !@children.include?(child)
    end

    def remove_child(child)
        child.parent = nil
        # @children -= child
        raise "Node is not a child" if !@children.include?(child)
    end

    def Searchable
        
    end


end



#            Node 1
#     Node 2        Node 3


