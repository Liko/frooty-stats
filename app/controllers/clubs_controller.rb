class ClubsController < ApplicationController

def index
  @clubs = Club.all
end
 
def show

    if session[:user_id]
      @user = User.find(session[:user_id])
      @favourited = User.favourited(session[:user_id], params[:id])
      @fav = Favourite.new
    end

    @club = Club.find(params[:id]) 
    @players = @club.players.sort_by{|player| player.position_id}


    @clubStats = @club.clubStat
    @parent = @club

    @stats_array = [
      "goals", "assists", "yellow_cards", "red_cards"
    ]

    @top_x = 5


end


end
