class EventsController < ApplicationController
  # before_action :logged_in_and_set_host, only[:new, :create, :update, :show]

  def index
     if  host_logged_in?
      @events =  current_host.events
    else
      redirect_to new_session_path
    end
  end

  def new
    if logged_in_and_set_host
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
    if logged_in_and_set_host
      find_event
    else
      redirect_to new_session_path
    end
  end

  def update
   if logged_in_and_set_host
     find_event.update(event_params)
     redirect_to host_events_path(@event.host)
   else
     redirect_to new_session_path
   end
  end

  def destroy
    find_event
    @event.destroy
    redirect_to host_events_path(@event.host)
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date ,:host_id, :venue_id)
 end

 def find_event
   @event = Event.find(params[:id])
 end
end
