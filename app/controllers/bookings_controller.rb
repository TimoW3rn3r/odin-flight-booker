class BookingsController < ApplicationController
  def new
    @booking = Booking.new

    @flight = Flight.find(params[:flight_id])
    num_tickets = params[:num_tickets].to_i

    num_tickets.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create(booking_params)

    if @booking.errors.any?
      @flight = Flight.find(booking_params[:flight_id])
      render :new, status: :unprocessable_entity
    else
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
