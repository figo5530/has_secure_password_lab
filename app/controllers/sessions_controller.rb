class SessionsController < ApplicationController
    def create
        @user = User.find_by(name: params[:user][:name])

        if @user.save && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to users_path
        else
            redirect_to '/login'
        end
    end
end