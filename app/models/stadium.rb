class Stadium < ApplicationRecord
    has_one :club
    has_many :matches
end
