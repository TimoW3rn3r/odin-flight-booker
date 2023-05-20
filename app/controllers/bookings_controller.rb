class BookingsController < ApplicationController
  def new
    @booking = Booking.new

    @flight = Flight.find(params[:flight_id])
    num_tickets = params[:num_tickets].to_i

    num_tickets.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create(booking_params)
    @flight = Flight.find(booking_params[:flight_id])

    if @booking.errors.any?
      render :new, status: :unprocessable_entity
    else
      @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger, flight: @flight).ticket_email.deliver_later
      end

      flash[:success] = "Booked successfully"
      redirect_to @booking
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email] )
  end
end
