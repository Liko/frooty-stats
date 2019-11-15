class Country < ApplicationRecord
    has_many :players
    has_many :clubs
end
