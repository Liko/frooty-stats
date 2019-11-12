class ClubsController < ApplicationController

def index
  @clubs = Club.all
end
 
def show
    @user = User.find(session[:user_id])
    @club = Club.find(params[:id]) 
    @favourited = User.favourited(session[:user_id], params[:id])
    @players = @club.players.sort_by{|player| player.position_id}
    @fav = Favourite.new
    @clubStats = @club.clubStat

    @stats_array = [
      "goals", "assists", "yellow_cards", "red_cards"
    ]

end


end
