class Host < ApplicationRecord
  has_many :events
  has_many :guests, through: :events
  has_many :venues, through: :events
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, length: {minimum: 4}
  validates :password, presence: true
end
