class VenuesController < ApplicationController
  layout 'logged_in', only: [:show, :index, :most_popular]
  before_action :unauthorized, only: [:show]

  def show
      @venue = Venue.find(params[:id])
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
