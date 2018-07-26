class Host < ApplicationRecord
  has_many :events
  has_many :guests, through: :events
  has_many :venues, through: :events
  has_secure_password
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true

  with_options if: :password do |host|
    host.validates :password, length: {minimum: 4}
    host.validates :password_confirmation, presence: { message: ': Passwords must match'}
  end

  def ordered_events
    self.events.order(:date)
  end

  def events_by_venue(venue_id)
    self.events.all.where(venue_id: venue_id)
  end

end
