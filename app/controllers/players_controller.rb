class PlayersController < ApplicationController

    def index
        @players = Player.all.sort_by{|player| player.position_id}
    end

    def show
        @player = Player.find(params[:id])
    end
end
