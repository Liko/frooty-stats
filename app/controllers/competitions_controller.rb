class CompetitionsController < ApplicationController

    def index
        @competitions = Competition.all
    end

    def show
        @competition = Competition.find(params[:id])
        @parent = @competition

        @stats_array = [
            "goals_overall", "assists_overall", "yellow_cards_overall", "minutes_played_overall", "penalty_goals", "penalty_misses", "red_cards_overall" 
        ]

        @top_x = 10


    end
end