class Match < ApplicationRecord
    # has_many :goals
    belongs_to :home_club, class_name: 'Club', required: true, foreign_key: :home_id
    belongs_to :away_club, class_name: 'Club', required: true, foreign_key: :away_id
    belongs_to :stadium 
    belongs_to :competition
end
