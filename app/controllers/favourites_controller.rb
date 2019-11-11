class FavouritesController < ApplicationController
    
    def index
        @favs = Favourite.all
    end

    def show
        @fav = Favourite.find(params[:id])
    end

    def new
        @fav = Favourite.new
        @clubs = Club.all
    end

    def create
        @fav = Favourite.create(favourite_params)
        redirect_to favourite_path(@fav)
    end

    def destroy
        @fav = Favourite.find(params[:id])
        @fav.destroy
        redirect_to _path
    end

    private

    def favourite_params
        params.require(:favourite).permit(:user_id, :club_id)
    end

end