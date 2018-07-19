class Event < ApplicationRecord
  belongs_to :host
  belongs_to :event
  has_many :guests

  validates :name, presence: true

end
