class EventsController < ApplicationController
  layout 'logged_in', only: [:index, :show, :new, :edit]
  before_action :unauthorized, only: [:edit, :new, :create, :update, :destroy]

  def index
     if host_logged_in?
      @events =  @host.ordered_events
    else
      redirect_to root_path
    end
  end

  def edit
    find_event
  end

  def new
      @event = Event.new
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
    if logged_in_and_set_host  == find_event.host
      redirect_to edit_host_event_path(current_host,find_event)
    end
  end

  def update
     find_event.update(event_params)
     redirect_to host_events_path(@event.host)
  end

  def destroy
      find_event
      @event.destroy
      redirect_to host_events_path(@event.host)
  end

  private

  def event_params
     params.require(:event).permit(:name, :description, :date ,:host_id, :venue_id, venue_attributes: [:name, :location])
   end

   def find_event
     @event = Event.find(params[:id])
   end


end
