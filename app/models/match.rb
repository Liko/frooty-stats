class Match < ApplicationRecord
    has_many :goals
    has_many :clubs
    belongs_to :stadium 
end
