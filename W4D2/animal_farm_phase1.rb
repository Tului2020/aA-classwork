
def move(name, animal_type, old_pos, distance)
    new_pos = old_pos + distance
    verb = case animal_type
        when "puppy"
            "scrambles"

        when "bear"
            "juggles and rides motorcycle"
        end
    puts "#{name} #{verb} from #{old_pos} to #{new_pos}"
end



def make_noise(name, animal_type)
    verb = case animal_type
        when "puppy"
            "yelp"
        end
    puts "#{name} #{verb}"

end



move("goodest dogo", "puppy", 0, 10)
move("misha", "bear", 0, 30)



