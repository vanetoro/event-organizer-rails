class Guest < ApplicationRecord
  belongs_to :event

  # add guest_id to event

  validates :name, presence: true
  validates :email, presence: true #unique

end
