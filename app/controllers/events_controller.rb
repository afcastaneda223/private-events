class EventsController < ApplicationController
    def index
        @events = Event.all
        @event = Event.new
    end

    def create
        @user = User.find(session[:current_user]["id"])
        @event = @user.events.build(event_params)

        if @event.save
            redirect_to events_path
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    private

    def event_params
        params.require(:event).permit(:description, :name, :date, :place)
    end
end
