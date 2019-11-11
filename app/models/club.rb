class Club < ApplicationRecord
    has_many :players
    belongs_to :country
    belongs_to :stadium
    belongs_to :competition
    # has_many :goals
    # has_many :clubColors
    # has_many :colors, through: :clubColors
end
