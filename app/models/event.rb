class Event < ApplicationRecord
  belongs_to :host
  belongs_to :venue, optional: true
  has_many :guests

  validates :name, presence: true

  def venue_attributes=(params)
    venue = Venue.find_or_create_by(name: params[:name], location: params[:location])
    self.venue = venue
  end

  # def venue=(venue)
  #   if venue.class == String
  #     binding.pry
  #   self.venue =  Venue.find(venue)
  #   end
  # end

  def venue
  end

end
