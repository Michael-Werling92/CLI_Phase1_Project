class CLI

    def run
        puts "Welcome to the Pokemon Type Battle Stats Tracker"
        #allow the audience to take in the title screen
        continue
        #call the load type method
        API.load_type
        #call the list type method
        list_type
        menu
    end

    def continue
        print "Press Enter to continue\r"
        gets
    end

    def list_type
        # Call our Type level all variable and loop through it to list the Types
        Type.all.each.with_index(1) do | type, i |
            puts "#{i}. #{type.name}"
        end
    end

    def menu
        puts "Please select a number from above to see the corresponding battle stats for each Pokemon type."
        input = gets.chomp
        # make sure the users input is good
        if !input.to_i.between?(1, Type.all.count)
            list_type
            menu
        else
            pokemon = Type.all[input.to_i-1]
            display_pokemon_details(pokemon)
        end
    end

end