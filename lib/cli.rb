class CLI

    def run
        puts "Welcome to the Pokemon Type Battle Stats Tracker"
        #allow the audience to take in the title screen
        continue
        #call the load type method
        API.load_type
        #call the list type method
        list_type
    end

    def continue
        print "Press Enter to continue\r"
        gets
    end

    def list_type
        #call the Type level from API and loop through to get all types
        Type.all.each.with_index(1) do | type, i |
            puts "#{i}. #{type.name}"
        end
    end

end