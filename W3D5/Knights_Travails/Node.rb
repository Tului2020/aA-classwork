class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(passed_node)
        @parent.children.delete(self) if @parent != nil
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
        raise "Node is not a child" if !@children.include?(child)
    end

    def dfs(target)
        return self if self.value == target
        return nil if self.children == []

        self.children.each do |child|
            some_var = child.dfs(target)
            return some_var if some_var != nil
        end
        return nil

    end



    def bfs(target)
        queue = [self]

        until (queue == [])
            if !queue.first.children.empty?
                queue += queue.first.children
            end
            if queue.first.value == target
                return queue.first
            else
                queue.shift
            end
        end
        return nil
    end


end
