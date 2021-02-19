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
    @user = User.find(params[:id])
    @attendances = @user.attendances
    def upcoming_events(attendances)
      attendances.select { |attendance| attendance.event.date >= Time.now }
    end
    def past_events(attendances)
      attendances.select { |attendance| attendance.event.date < Time.now }
    end

    @upcommings = upcoming_events(@attendances)

    @pasts = past_events(@attendances)

  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
