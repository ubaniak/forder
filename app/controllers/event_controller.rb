class EventController < ApplicationController
    def new 
        @event = Event.new
    end

    def create
        @event = Event.new(get_params)
        @event.save
        redirect_to root_path
    end

    def show
    end

    def get_params
        params.require(:event).permit(:group_id)
    end
end
