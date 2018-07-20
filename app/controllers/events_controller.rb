class EventsController < ApplicationController

  def index
     if  host_logged_in?
      @events =  current_host.events
      binding.pry
    else
      redirect_to new_session_path
    end
  end

  def create
    binding.pry
  end

  def show
    binding.pry
  end

end
