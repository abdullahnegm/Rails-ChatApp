class SessionsController < ApplicationController
    before_action :nil_user, only: [:new, :create]

    def new 
        render template: 'users/new'
    end

    def create
        user = User.find_by(name: params[:session][:name])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to new_chats_path
        else
            flash.now[:error] = "Wrong Credentials"
            render 'users/new'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end

    private

    def session_params
        params.require(:session).permit(:name, :password)
    end

end