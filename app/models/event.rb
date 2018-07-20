class Event < ApplicationRecord
  belongs_to :host
  belongs_to :venue
  has_many :guests

  validates :name, presence: true

end
