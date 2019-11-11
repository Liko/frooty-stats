class FavouritesController < ApplicationController
    
    def index
        @favs = Favourite.all
    end

    def show
        @fav = Favourite.find(params[:id])
    end

    def new
        @favourite = Favourite.new
    end

    def create
        @club = Club.find(params[:favourite][:club_id])
        Favourite.create(user_id: session[:user_id], club_id: @club.id)
        redirect_to club_path(@club)
    end

    def destroy
        @club = Club.find(params[:id])
        @favourited = User.favourited(session[:user_id], params[:id])
        @favourited.destroy
        redirect_to club_path(@club)
    end

    private

    def favourite_params
        params.require(:favourite).permit(:user_id, :club_id)
    end

end