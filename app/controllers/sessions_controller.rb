class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find(params[:user][:name])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render "new"
            flash[:alert] = "User Login/Password invalid. Please try again."
        end
    end

    def destroy
    end
end