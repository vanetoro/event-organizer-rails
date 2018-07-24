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
  validates :password, confirmation: true
  validates :password_confirmation, presence: { message: ': Passwords must match'}

  def ordered_events
    self.events.order(:date)
  end

  def events_by_venue(venue_id)
    self.events.all.where(venue_id: venue_id)
  end

  # def validate!
  #    self.errors.add(:name, :blank, message: "cannot be blank") if name.nil?
  #    self.errors.add(:name, :blank, message: "cannot be blank") if email.nil?
  #  end

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |host|
  #     host.provider = auth.provider
  #     host.uid = auth.uid
  #     host.name = auth.info.name
  #     host.oauth_token = auth.credentials.token
  #     host.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #     host.save!
  #   end
  # end
end
