class Item

    attr_accessor :title, :deadline, :description

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
    end

    def self.valid_date?(date)
        y, m, d = date.split("-").map {|el| el.to_i}
        return true if (1 <= m && m <= 12) && (1 <= d && d <= 31) 
        false
    end

end


p Item.valid_date?('2012-12-31')


