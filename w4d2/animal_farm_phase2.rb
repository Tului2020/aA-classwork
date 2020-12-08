class Farm

    def initialize(animals)
        @animals = animals
    end

    def each_animal(&blk)
        @animals.each(&blk)
    end
end


class Puppy

    def initialize(name, pos)
        @name = name
        @pos = pos
    end

    def yelp
        puts "#{@name} yelps"
    end


    def scrambles
        puts "#{@name} scrambles"
    end

    def greet(other_pup)
        puts "#{@name} and #{other_pup.name} sniff and tackle"
    end

    # protected = cannot be called outside of the class
    # allows an explicit receiver of the same class type
    protected
    attr_reader :pos, :name

    private # does not allow an explicit receiver
    # attr_reader :name
    attr_writer :name, :pos

end


class Bear
    def initialize(name, pos)
        @name = name
        @pos = pos
    end


    def roars
        puts "#{@name} roars"
    end

    def motorcycles
        puts "#{@name} motorcycles"
    end
end



titus = Puppy.new("Titus", 0)
obi = Puppy.new("Obi", 0)
misha = Bear.new("Misha", 0)

farm = Farm.new([titus, obi, misha])

farm.each_animal do |animal|
    case animal
    when Puppy
        animal.yelp
    when Bear
        animal.roars
    end

end




