class UsersController < ApplicationController
  def home
  end

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.nil?
      redirect_to root_path
    else
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def show
    if logged_in?
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def logged_in?
    session[:user_id].blank? || session[:user_id].nil?
  end
end
