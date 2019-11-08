class Club < ApplicationRecord
    has_many :players
    belongs_to :country
end
