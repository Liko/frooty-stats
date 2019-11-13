class Match < ApplicationRecord
    # has_many :goals
    belongs_to :home_club, class_name: 'Club', required: true, foreign_key: :home_id
    belongs_to :away_club, class_name: 'Club', required: true, foreign_key: :away_id
    belongs_to :stadium 
    belongs_to :competition

    def home_club_name
        self.home_club.name
    end

    def away_club_name
        self.away_club.name
    end

    def real_date
        date = DateTime.strptime(self.date.to_s,'%s')
        date.strftime("%A %d %B %Y")   
    end

    def real_time
        date = DateTime.strptime(self.date.to_s,'%s')
        date.strftime("%R")
    end

    def print_status
        if self.status == "complete"
            "Final Result"
        elsif self.status == "incomplete"
            "Yet to be Played."
        end
    end

    def getStat(stat)
        {
            :team_a_stat => self.send("team_a_#{stat}"),
            :team_b_stat => self.send("team_b_#{stat}")
        }
    end

    def self.sortResultsByRecentAndCompetitionId(competition_id)
        sorted_matches = Match.where(competition_id: competition_id).sort_by{|match|-match.date}.select{|match|match.status=="complete"}
    end

    def self.sortFixturesByUpcomingAndCompetitionId(competition_id)
        sorted_matches = Match.where(competition_id: competition_id).sort_by{|match|match.date}.select{|match|match.status=="incomplete"}
    end
end
