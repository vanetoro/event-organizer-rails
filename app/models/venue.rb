class Venue < ApplicationRecord
  has_many :events
  has_many :hosts, through: :events
  has_many :guests, through: :events
  validates :name, presence: true
  validates :location, presence: true



  def self.all_venues
    self.all.order(name: :asc)
  end

  def self.most_popular_venue
    joins(:events).group('venue_id').order('count(events.venue_id)desc').limit(5)
  end

  def self.least_popular_venue
    joins(:events).group('venue_id').order('count(events.venue_id)asc').limit(5)
  end

end
