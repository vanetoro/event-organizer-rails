class VenuesController < ApplicationController
  layout 'logged_in', only: [:show, :index]

  def show
    if logged_in_and_set_host
      @events = current_host.events_by_venue(params[:id])
    else
      redirect_to root_path
    end
  end

  def index
    current_host
    @venues = Venue.all_venues
    @most_popular = Venue.most_popular_venue
  end
end
