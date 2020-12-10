class Farm

    def initialize(animals)
        @animals = animals
    end

    def each_animal(&blk)
        @animals.each(&blk)
    end
end

class Animal

    def initialize(name, pos)
        @name = name
        @pos = pos
    end

    def move(distance)
        old_
    end



    def make_noise
        puts "#{@name} #{self.noise}!!!"
    end

end


module Flyable
    def fly
        puts "#{name} can fly! WOOw!"
    end

end


class Puppy < Animal
    # extend makes it a class method
    # include makes it an instance method
    include Flyable

    def initialize(name, pos, color)
        super(name, pos)
        @color = color # say color is only specific to a puppy
    end

    # def make_noise
    #     puts "#{@name} yelps"
    # end

    def movement
        "scrambles"
    end

    def noise
        "Yelps"
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







class Bear < Animal
    def initialize(name, pos)
        @name = name
        @pos = pos
    end


    def make_noise
        puts "#{@name} roars"
    end

    def motorcycles
        puts "#{@name} motorcycles"
    end

    def movement
        "motorcycles"
    end

    def noise
        "Roars"
    end
end



titus = Puppy.new("Titus", 0, "red")
# misha = Bear.new("Misha", 0)

titus.fly
