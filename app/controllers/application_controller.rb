class ApplicationController < ActionController::Base

    before_action :current_user
    before_action :favourite_clubs

    def current_user
        @user = (User.find_by(id: session[:user_id]) || User.new)
    end

    def logged_in?
        current_user.id != nil
    end

    def require_logged_in
        return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
    end

    def favourite_clubs
        user_favs = current_user.favourites
        @fav_clubs = Club.where(id: user_favs.map(&:club_id))
    end

end
