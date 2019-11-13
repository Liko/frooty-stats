class Club < ApplicationRecord
    include TopStats::InstanceMethods

    has_many :players
    belongs_to :country
    belongs_to :stadium
    belongs_to :competition
    has_one :clubStat
    has_many :home_matches, class_name: 'Match', foreign_key: :home_id
    has_many :away_matches, class_name: 'Match', foreign_key: :away_id
    # has_many :goals
    # has_many :clubColors
    # has_many :colors, through: :clubColors
    has_many :favourites
    has_many :users, through: :favourites

end
