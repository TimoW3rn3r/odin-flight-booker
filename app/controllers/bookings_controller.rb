class BookingsController < ApplicationController
  def new
    @booking = Booking.new

    @flight = Flight.find(params[:flight_id])
    num_tickets = params[:num_tickets].to_i

    num_tickets.times { @booking.passengers.build }
  end

  def create
  end
end
