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

        type_ineffective=type_stats[:no_damage_to].map { |h| [h[:name], h[:url]] }.to_h.keys.join(', ')

        if type_weakness.length == 0
            type.weakness = "NO"
        else
            type.weakness = type_weakness
        end

        if type_strength.length == 0
            type.strength = "NO"
        else
            type.strength = type_strength
        end

        if type_resistance.length == 0
            type.resistance = "NO"
        else
            type.resistance = type_resistance
        end

        if type_acceptance.length == 0
            type.acceptance = "NO"
        else
            type.acceptance = type_acceptance
        end

        if type_immunity.length == 0
            type.immunity = "NO"
        else
            type.immunity = type_immunity
        end

        if type_ineffective.length == 0
            type.ineffective = "NO"
        else
            type.ineffective = type_ineffective
        end
    end

end