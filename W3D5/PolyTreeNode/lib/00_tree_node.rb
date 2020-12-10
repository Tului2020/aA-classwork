class PolyTreeNode

  attr_accessor :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil 
    @children = []
  end

  def parent=(new_parent)
    @parent.children.delete(self) unless !@parent
    
    if new_parent
      @parent = new_parent
      @parent.children << self
    else
      @parent = nil
    end
  end

  def add_child(child_node)
    child_node.parent=self
  end

  def remove_child(child_node)
    if @children.include?(child_node)
      
      child_node.parent=nil
      @children.delete(child_node)
    else
      raise "Not a child of mine(${self.value})"
    end
  end

  def dfs(target_value)
    return self if self.value == target_value

    @children.each do |child|
      search = child.dfs(target_value)
      return search unless search.nil?
    end
    nil
  end

  def bfs(target_value)
    _q = [self]
    #checking self == target 
    until _q.empty?
    #investigating each child 
      node = _q.shift
      return node if node.value == target_value
      #for each child ---Q << child.children
      node.children.each{|c|_q.push(c)}
    end
    nil
  end

  def inspect
    str = "parent= " 
    @parent ? str+=@parent.value : str+='nil'
    str+= ' \n ' + "children= " + @children.to_s
    str
  end

end