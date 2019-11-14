class Position < ApplicationRecord
    has_many :players

    def self.position_id_array
        Position.all.map{|position|position.id}
    end

end
