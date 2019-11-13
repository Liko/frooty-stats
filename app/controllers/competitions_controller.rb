class CompetitionsController < ApplicationController

    def index
        @competitions = Competition.all
    end

    def show
        @competition = Competition.find(params[:id])
        @parent = @competition

        @results = Match.sortResultsByRecentAndCompetitionId(@competition.id)

        @fixtures = Match.sortFixturesByUpcomingAndCompetitionId(@competition.id)

        @player_stats_array = [
            {"goals_overall" => "Goals Scored"},
            {"assists_overall" => "Assists Made"},
            {"penalty_goals" => "Penalties Scored"},
            {"penalty_misses" => "Penalties Missed"},
            {"yellow_cards_overall" => "Yellow Cards"},
            {"red_cards_overall" => "Red Cards"},
            {"minutes_played_overall" => "Minutes Played"}
          ]

        @club_stats_array = [
            {"seasonGoals_overall" => "Goals Scored"},
            {"seasonConceded_overall" => "Goals Conceded"},  
            {"seasonWinsNum_overall" => "Wins"}, 
            {"seasonDrawsNum_overall" => "Draws"},
            {"seasonLossesNum_overall" => "Losses"},
            {"average_attendance_home" => "Average Attendance"}, 
            {"shotsTotal_overall" => "Shots Taken"},
            {"shotsOnTargetTotal_overall" => "Shots on Target"}, 
            {"foulsTotal_overall" => "Fouls Made"}, 
            {"offsidesTotal_overall" => "Offsides"},
            {"seasonCS_overall" => "Clean Sheets"},
            {"possessionAVG_overall" => "Ball Possession"},
            {"cornersTotal_overall" => "Corners Taken"}
        ]

        @top_x = 10


    end
end