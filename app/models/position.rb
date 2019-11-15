class Position < ApplicationRecord
    has_many :players

    def self.position_id_array
        Position.all.map{|position|position.id}
    end

    def self.get_pluralized_name(id)
        self.find(id).name.pluralize
    end

end
