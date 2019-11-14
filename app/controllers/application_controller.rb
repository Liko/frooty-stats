class ApplicationController < ActionController::Base

    before_action :current_user
    before_action :favourite_clubs

    helper_method :logged_in?, :redirect_if_logged_in, :favourites_limit?

    def current_user
        @user = (User.find_by(id: session[:user_id]) || User.new)
    end

    def logged_in? 
        current_user.id != nil
    end

    def redirect_if_logged_in
        if logged_in?
            redirect_to controller: 'home', action: 'today'
        end
    end

    def favourite_clubs
        user_favs = current_user.favourites
        @fav_clubs = Club.where(id: user_favs.map(&:club_id))
    end

    def favourites_limit?
        @user.favourites.count == 5
    end
end
