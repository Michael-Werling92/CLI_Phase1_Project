require 'pry'

class API

    def self.load_type
        resp = RestClient.get('https://pokeapi.co/api/v2/type')
        type_hash = JSON.parse(resp.body, symbolize_names: true)
        type_array = type_hash[:results]
        type_array.map do | type |
            Type.new(type)
        end
    end

    def self.display_pokemon_details(type)
        resp= RestClient.get(type.url)
        type_array = JSON.parse(resp.body, symbolize_names: true)
        type_stats = type_array[:damage_relations]
        binding.pry
    end

end