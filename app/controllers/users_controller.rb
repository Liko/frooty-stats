class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
    end

    def new
    end
  
    def create
      @user = User.create(user_params)
      return redirect_to controller: 'users', action: 'new' unless @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'welcome', action: 'home'
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to controller: 'welcome', action: 'home'
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to controller: 'sessions', action: 'new'
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

end
