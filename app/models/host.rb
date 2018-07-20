class Host < ApplicationRecord
  has_many :events
  has_many :guests, through: :events
  has_many :venues, through: :events
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true   #unique
  validates :password, presence: true
end
