class Host < ApplicationRecord
  has_many :events
  has_many :guests, through: :events
  has_many :venues, through: :events
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 4}
  validates :password, presence: true


  def ordered_events
    self.events.order(:date)
  end

  def events_by_venue(venue_id)
    self.events.all.where(venue_id: venue_id)
  end
end
