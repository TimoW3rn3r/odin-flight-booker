class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers

  accept_nested_attributes_for :passengers
end
