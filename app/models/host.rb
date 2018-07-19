class Host < ApplicationRecord
  has_many :events
  has_many :guests, through: :events
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
