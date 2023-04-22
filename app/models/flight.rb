class Flight < ApplicationRecord
  
  # Attributes
  # departure_airport_id:reference
  # arrival_airport_id:reference
  # date:date
  # time:time
  # duration:int

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings
  has_many :passenger, through: :bookings
  
  def formatted_time
    time.strftime("%l:%M %p")
  end
end
