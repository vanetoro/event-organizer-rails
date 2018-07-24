class VenuesController < ApplicationController
  layout 'logged_in', only: :show

  def show
    @events = current_host.events_by_venue(params[:id])
  end
end
