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

    def self.getFixturesForClub(club_id, competition_id)
        home_fixtures = Match.where(competition_id: competition_id, home_id: club_id).select{|match|match.status=="incomplete"}

        away_fixtures = Match.where(competition_id: competition_id, away_id: club_id).select{|match|match.status=="incomplete"}

        fixtures = (home_fixtures + away_fixtures).sort_by{|fixture|fixture.date}
    end

    def self.getResultsForClub(club_id, competition_id)
        home_results = Match.where(competition_id: competition_id, home_id: club_id).select{|match|match.status=="complete"}

        away_results = Match.where(competition_id: competition_id, away_id: club_id).select{|match|match.status=="complete"}

        results = (home_results + away_results).sort_by{|result|-result.date}
    end

    def self.getMostRecentResult(club)
        #with club return result
        home_results = Match.where(home_id: club.id).select{|match|match.status=="complete"}

        away_results = Match.where(away_id: club.id).select{|match|match.status=="complete"}

        (home_results + away_results).sort_by{|result|-result.date}.first
    end

    def self.getUpcomingFixture(club)
        home_fixtures = Match.where(home_id: club.id).select{|match|match.status=="incomplete"}

        away_fixtures = Match.where(away_id: club.id).select{|match|match.status=="incomplete"}

        (home_fixtures + away_fixtures).sort_by{|fixture|fixture.date}.first
    end

    def self.getRelevantMatches(club)
        result = Match.getMostRecentResult(club)
        fixture = Match.getUpcomingFixture(club)

        matches = {
            :club => club,
            :result => result,
            :fixture => fixture
        }
    end

    def self.getUpcomingFixtures(num_matches)
        fixtures = Match.all.select{|match|match.status=="incomplete"}
        fixtures.sort_by{|fixture|fixture.date}[0...num_matches]
    end




end
