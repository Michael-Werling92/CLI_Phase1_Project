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

        type_weakness=type_stats[:double_damage_from].map { |h| [h[:name], h[:url]] }.to_h.keys.join(', ')
        
        type_strength=type_stats[:double_damage_to].map { |h| [h[:name], h[:url]] }.to_h.keys.join(', ')

        type_resistance=type_stats[:half_damage_from].map { |h| [h[:name], h[:url]] }.to_h.keys.join(', ')

        type_acceptance=type_stats[:half_damage_to].map { |h| [h[:name], h[:url]] }.to_h.keys.join(', ')

        type_immunity=type_stats[:no_damage_from].map { |h| [h[:name], h[:url]] }.to_h.keys.join(', ')

        type_ineffectve=type_stats[:double_damage_from].map { |h| [h[:name], h[:url]] }.to_h.keys.join(', ')
    end

end