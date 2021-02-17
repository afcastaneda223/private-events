class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to events_path
      session[:current_user] = @user
    end
  end

  def show
    @user = User.find(session[:current_user]["id"])
    @events = @user.events
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
