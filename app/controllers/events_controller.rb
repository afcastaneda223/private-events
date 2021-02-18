class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new
  end

  def create
    @user = User.find(session[:current_user]['id'])
    @event = @user.created_events.build(event_params)

    redirect_to events_path if @event.save
  end

  def show
    @event = Event.find(params[:id])
    @attendances = @event.attendances
  end

  def attend
    @user = User.find(session[:current_user]['id'])
    @attend = @user.attendances.build(event_id: params[:id])

    redirect_to event_path(params[:id]) if @attend.save
  end

  private

  def event_params
    params.require(:event).permit(:description, :name, :date, :place)
  end
end
