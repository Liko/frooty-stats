class ClubsController < ApplicationController

def index
  @clubs = Club.all
end
 
def show
    @club = Club.find(params[:id]) 
    @players = @club.players.sort_by{|player| player.position_id}
end


end
