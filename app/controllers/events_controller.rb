class EventsController < ApplicationController
    def index
        @events = Event.all
        @event = Event.new
    end

    def create
        @user = User.find(session[:current_user]["id"])
        @event = @user.created_events.build(event_params)

        if @event.save
            redirect_to events_path
        end
    end

    def show
        @event = Event.find(params[:id])
        @attendances = @event.attendances
    end

    def attend
        @user = User.find(session[:current_user]["id"])
        @attend = @user.attendances.build(event_id: params[:id])

        if @attend.save
            redirect_to event_path(params[:id])
        end
        
    end

    private

    def event_params
        params.require(:event).permit(:description, :name, :date, :place)
    end

end
