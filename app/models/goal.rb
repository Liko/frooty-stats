class Goal < ApplicationRecord
    has_many :players
    belongs_to :club
    belongs_to :match
end
