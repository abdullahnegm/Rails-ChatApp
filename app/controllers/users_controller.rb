class UsersController < ApplicationController
    before_action :nil_user, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to new_chats_path
        else
            flash.now[:error] = "Wrong Entries"
            render 'users/new'
        end
    end


    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end