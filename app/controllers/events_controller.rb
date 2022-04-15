class EventsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :index]
  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice]="You have created event successfully."
      redirect_back(fallback_location: root_path)

    else
     @events = Event.all
     render :index
    end
  end

  def index
    @events = event.all
  end
  
  private
  
    def event_params
      params.require(:event).permit(:event_date, :address)
    end
end
