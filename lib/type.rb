class Type

    attr_accessor :name, :url, :weakness, :strength, :resistance, :acceptance, :immunity, :ineffective
    @@all = []

    def initialize(type)
        @name = type[:name]
        @url = type[:url]
        @@all << self
    end

    def self.find_by_type(type_name)
        self.all.find {|type_info| type_info.name == type_name}
    end


    def self.all
        @@all
    end

end