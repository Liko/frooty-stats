class ClubsController < ApplicationController

  def index
    @clubs = Club.all.sort_by{|club|club.name}
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

      @player_stats_array = [
        {"goals_overall" => "Goals Scored"},
        {"assists_overall" => "Assists Made"},
        {"yellow_cards_overall" => "Yellow Cards"},
        {"red_cards_overall" => "Red Cards"} 
      ]

      @top_x = 5
  end



end
