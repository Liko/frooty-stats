class SessionsController < ApplicationController

    def new
      redirect_if_logged_in
    end
  
    def create
      user = User.find_by(username: params[:user][:username])

      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        @user = user
        redirect_to controller: 'home', action: 'today'
      else
        flash[:errors] = "Invalid username or password. Please revise your input."
        return redirect_to controller: 'sessions', action: 'new'
      end
    end
  
    def destroy
      session.delete :user_id
  
      redirect_to '/'
    end

end