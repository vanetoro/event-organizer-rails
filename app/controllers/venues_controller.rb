class VenuesController < ApplicationController
  layout 'logged_in', only: :show

  def show
    if logged_in_and_set_host
      @events = current_host.events_by_venue(params[:id])
    else
      redirect_to root_path
    end
  end

  def index
    @venues = Venue.all_venues
  end
end
