class Player < ApplicationRecord
    belongs_to :position
    belongs_to :club
    belongs_to :country
end
