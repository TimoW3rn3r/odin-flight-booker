class FlightsController < ApplicationController
  def index
    @airports = Airport.all.order(:name)
    @flights = Flight.select(:date).distinct.order(:date)
    @passengers_options = (1..4).map { |x| [x, x]}
  end
end
