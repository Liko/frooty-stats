class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
    end

    def new
        redirect_if_logged_in
    end
  
    def create
      @user = User.new(user_params)

      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to controller: 'home', action: 'today'
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to controller: 'users', action: 'new'
      end
    end

    # def edit
    #     @user = User.find(params[:id])
    # end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
          redirect_to controller: 'home', action: 'today'
        else
          flash[:errors] = @user.errors.full_messages
          redirect_to controller: 'users', action: 'show'
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        session.delete :user_id
        redirect_to '/'
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

end
