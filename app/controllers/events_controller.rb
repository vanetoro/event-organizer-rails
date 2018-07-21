class EventsController < ApplicationController

  def index
     if  host_logged_in?
      @events =  current_host.events

    else
      redirect_to new_session_path
    end
  end

  def new
    if host_logged_in?
      @event = Event.new
      current_host
    else
      redirect_to new_session_path
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to host_events_path(@event.host)
    else
      render :new
    end
  end

  def show
    binding.pry
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date ,:host_id, :venue_id)
 end
end
