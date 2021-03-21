class CLI

    def run
        puts "Welcome to the Pokemon Type Battle Stats Tracker"
        puts"                                   ,' |                                  "
        puts"     _.----.        ____         ,'  _|   ___    ___       ____      __  "
        puts"  ,-'       `.     |    |  /`.   |,-'    |      /   |     |    '-   |  `." 
        puts" |      __    |    '-.  | /   `.  ___    |     /    |     '-.    |  |    |"
        puts"  |.    | |   |  __  |  |/    ,','_  `.  |          | __    |    |__|    |"
        puts"    |   |_|   /,' _`.|      ,' / / / /   |           ,'  `. |            |"
        puts"     |     ,-'/  / | |    ,'   | |  / ,`.|             /'.  |            |"
        puts"      |    | |   |_/ |   `-.   |   `'  / |   |     ||  '._/ |            |"
        puts"       |    | |      /       `-.`.___,-' |   |    /||       |   |'-_     |"
        puts"        |    | `.__,'|  |`-._    `|      |_ _|   / | `.__,  |   |   '-,  |"
        puts"         |_.-'       |__|    `-._ |                '-.|     '-._|     |__|"
        puts"                                 `'                                       "
        
        
        #allow the audience to take in the title screen
        continue
        #call the load type method
        API.load_type
        #call the list type method
        list_type
        menu
        continue_again
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

    def display_pokemon_details(type)
        API.display_pokemon_details(type)
        puts "Here are the battle details for #{type.name.capitalize} Pokemon:"
        puts
        puts "Super Effective against #{type.strength.green} Pokemon. (x2 damage to)"
        puts
        puts "Weak against #{type.weakness.red} attacks. (x2 damage from)"
        puts
        puts "Resistant to #{type.resistance.green} attacks. (x0.5 damage from)"
        puts
        puts "#{type.acceptance.capitalize.red} type pokemon are resistant to this Pokemon type's attacks. (x0.5 damage to)"
        puts
        puts "This Pokemon type is immune to #{type.immunity.green} attacks. (0 damage from)"
        puts
        puts "#{type.ineffective.capitalize.red} type pokemon are immune to this Pokemon type's attacks. (0 damage to)"
    end

    def continue_again
        puts
        puts "Press Enter to view details on another Pokemon Type."
        gets
        list_type
        menu
    end

end