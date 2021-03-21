class Type

    attr_accessor :name, :url, :weakness, :strength, :resistance, :acceptance, :immunity, :ineffective
    @@all = []

    def initialize(type)
        @name = type[:name]
        @url = type[:url]
        @@all << self
    end

    def self.all
        @@all
    end

end