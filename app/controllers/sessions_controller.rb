class SessionsController < ApplicationController

    def new
      redirect_if_logged_in
    end
  
    def create
      user = User.find_by(username: params[:user][:username])
  
      user = user.try(:authenticate, params[:user][:password])
  
      return redirect_to(controller: 'sessions', action: 'new') unless user
  
      session[:user_id] = user.id
  
      @user = user
  
      redirect_to controller: 'home', action: 'today'
    end
  
    def destroy
      session.delete :user_id
  
      redirect_to '/'
    end

end