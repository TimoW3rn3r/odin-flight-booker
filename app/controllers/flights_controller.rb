class FlightsController < ApplicationController
  def index
    @airports = Airport.all.order(:airport_name)
    @flights = Flight.select(:date).distinct.order(:date)
    @passengers_options = (1..4).map { |x| [x, x]}

    @flight_results = Flight.where(
      "departure_airport_id = ? AND arrival_airport_id = ? AND date = ?",
        params[:departure_airport_id],
        params[:arrival_airport_id],
        params[:date],
    )
  end
end
