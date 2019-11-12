class CompetitionsController < ApplicationController

    def index
        @competitions = Competition.all
    end

    def show
        @competition = Competition.find(params[:id])
        @parent = @competition

        @stats_array = [
            "goals", "assists", "yellow_cards", "red_cards"
        ]

        @top_x = 10


    end
end