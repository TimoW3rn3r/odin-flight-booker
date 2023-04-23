class Passenger < ApplicationRecord
  has_many :bookings
  has_many :flights, through: :bookings

  belongs_to :booking

  validates :name, presence: true
  validates :email, presence: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    on: :create
  }
end
