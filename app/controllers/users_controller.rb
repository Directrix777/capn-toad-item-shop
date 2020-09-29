class UsersController < ApplicationController
    before_action :set_admin

    def new
        @user = User.new
        if current_user
            redirect_to '/' 
        end
    end

    def create
        @user = User.new(user_params)
        @user.admin = false
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
        if @user != current_user
            redirect_to '/'
        end
    end

    def index
        if !@admin
            redirect_to '/'
        end
        @users = User.all
    end

    def show_toggle
        
    end

    private

    def set_admin
        @admin = current_user.admin
    end

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
