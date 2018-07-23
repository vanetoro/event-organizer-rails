class Event < ApplicationRecord
  belongs_to :host
  belongs_to :venue, optional: true
  has_many :guests

  validates :name, presence: true

  def venue_attributes=(attr)
    venue = Venue.create(attr)
    self.venue = venue
  end

  def venue=(venue)
    if venue.class == String
      binding.pry
    self.venue =  Venue.find(venue)
    end
  end

  def venue
  end

end
