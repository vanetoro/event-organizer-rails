class Venue < ApplicationRecord
  has_many :events
  has_many :hosts, through: :events
  has_many :guests, through: :events
  validates :name, presence: true
  validates :location, presence: true

  def self.all_venues
    self.all.uniq
  end
end
