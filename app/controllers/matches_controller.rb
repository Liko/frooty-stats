class MatchesController < ApplicationController

    def show
        @match = Match.find(params[:id])

        @parent = @match

        @match_stats_array = [
            "possession", "shots", "shotsOnTarget", "corners", "offsides", "fouls", "yellow_cards", "red_cards"
        ]
    end
end
