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

    def players_sorted_by_position
        self.players.sort_by{|player| player.position_id}
    end

    def players_grouped_by_position

        sorted_players_array = self.players_sorted_by_position
        position_id_array = Position.position_id_array
        position_hash = Hash[position_id_array.map {|id| [id,[]]}]

        sorted_players_array.each do |player|
            position_hash[player.position_id] << player
        end

        position_hash
    end

    def self.sort_alphabetically(club_array)
        club_array.sort_by{|club|club.name}
    end

end
