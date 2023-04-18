class Airport < ApplicationRecord

  # Attributes
  # airport_code:string
  # airport_name:string

  has_many :departing_flights, foreign_key: :departure_airport_id, class_name: "Flight", dependent: :destroy
  has_many :arriving_flights, foreign_key: :arrival_airport_id, class_name: "Flight", dependent: :destroy
end
