class Competition < ApplicationRecord
    include TopStats::InstanceMethods

    has_many :clubs
    has_many :players
    has_many :matches

    def getClubStatsByLeaguePosition
        self.clubs.map{|club|club.clubStat}.sort_by{|clubStat|clubStat.leaguePosition_overall}
    end

    def country
        self.clubs.first.country.name
    end
end
