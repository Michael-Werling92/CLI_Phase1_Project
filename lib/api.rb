class API

    def self.load_type
        resp = RestClient.get('https://pokeapi.co/api/v2/type')
            type_hash = JSON.parse(resp.body, symbolize_names: true)
        type_array = type_hash[:results]
        type_array.map do | type |
            Type.new(type)
        end
    end
end