class EventsController < ApplicationController

  def index
     if  host_logged_in?
      @events =  current_host.events

    else
      redirect_to new_session_path
    end
  end

  def new
    if creating_or_editing_event
      @event = Event.new
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
    if creating_or_editing_event
      @event = Event.find(params[:id])
    else
      redirect_to new_session_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to host_events_path(@event.host)
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date ,:host_id, :venue_id)
 end
end
