class CompetitionsController < ApplicationController

    def index
        @competitions = Competition.all
    end

    def show
        @competition = Competition.find(params[:id])
        @parent = @competition

        @player_stats_array = [
            "goals_overall", "assists_overall", "yellow_cards_overall", "minutes_played_overall", "penalty_goals", "penalty_misses", "red_cards_overall" 
        ]

        @club_stats_array = [
            "seasonGoals_overall", "seasonConceded_overall",  "seasonWinsNum_overall", "average_attendance_home", "shotsOnTargetTotal_overall", "foulsTotal_overall", "offsidesTotal_overall", "seasonCS_overall", 
        ]

        @top_x = 10
    end
end