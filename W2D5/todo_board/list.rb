require_relative 'item'

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end


    def add_item(title, deadline, description="")
        if !Item.valid_date?(deadline)
            return false
        else
            @items << Item.new(title, deadline, description)
            return true
        end
    end


    def size
        @items.length
    end
    

    def valid_index?(index)
        return true if 0 <= index && index < self.size 
        false
    end



end

list = List.new("hel")
p list.size
list.add_item("new", "2019-10-30")
p list.size
p list.valid_index?(0)
