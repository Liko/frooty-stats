class HomeController < ApplicationController

    def today
        @favourites = favourite_clubs
        @club_matches_array = []

        @favourites.each do |club|
            @club_matches_array << Match.getRelevantMatches(club) 
        end

        @competition_array  = @favourites.map{|club|club.competition}.uniq

        num_upcoming_fixtures = 10
        @upcoming_fixtures = Match.getUpcomingFixtures(num_upcoming_fixtures)

    end

end