class Match < ApplicationRecord
    # has_many :goals
    has_many :clubs
    belongs_to :stadium 
    belongs_to :competition

end
