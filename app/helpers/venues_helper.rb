module VenuesHelper

  def   display_num_of_events(venue )
    if venue.events.count > 0
      "# of events #{venue.events.count}"
    else
      'Currently there are no events at this venue'
    end
  end
end
