class VenuesController < ApplicationController
  layout 'logged_in', only: [:show, :index, :most_popular]

  def show
    if logged_in_and_set_host
      @events = current_host.events_by_venue(params[:id])
    else
      redirect_to root_path
    end
  end

  def index
    current_host
    @most_popular = false
    @venues = Venue.all_venues
  end

  def most_popular
    current_host
    @most_popular = true
     @venues = Venue.most_popular_venue
     render :index
   end


end
