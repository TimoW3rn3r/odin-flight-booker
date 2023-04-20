class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @num_tickets = params[:num_tickets]
  end
end
