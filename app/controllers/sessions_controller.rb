class SessionsController < ApplicationController
    def new
        if session[:user_id]
            redirect_to '/'
        end
    end
  
    def create
      
      @user = User.find_by(username: params[:username])
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  
    def destroy
      session.delete :user_id
      redirect_to '/'
    end
  end