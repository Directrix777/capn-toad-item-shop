class UsersController < ApplicationController

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
        @user = current_user
    end

    def index
        admin_only
        @users = User.all
    end

    def show_toggle
        admin_only
        @user = User.find(params[:id])
    end

    def toggle
        admin_only
        @user = User.find(params[:id])
        @user.update(admin: !@user.admin)
        redirect_to "/toggle/#{params[:id]}"
    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
