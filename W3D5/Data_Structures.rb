class MyQueue

end

class Stacks

end

class TreeADT
    # Node = basic unit making a Tree
    # typically holds a value and references to its children
    # root note is the tree
    # internal nodes vs. leaf nodes
    # the Node class can be used rather than creating a Tree class

end


class Node 

    def initialize(value, children = [])
        @value = value
        @children = children 
    end

end


d = Node.new("d")
e = Node.new("e")
f = Node.new("f")
g = Node.new("g")
b = Node.new("b", [d, e])
c = Node.new("b", [f, g])
p a = Node.new("b", [b, c])


