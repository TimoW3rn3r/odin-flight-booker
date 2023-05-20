class PassengerMailer < ApplicationMailer
  default from: "flight-booker@ultrapw.cf"
  layout 'mailer'

  def ticket_email
    @passenger = params[:passenger]
    @flight = params[:flight]
    mail(to: @passenger.email, subject: '[OdinFlightBooker] Flight Booked')
  end
end
