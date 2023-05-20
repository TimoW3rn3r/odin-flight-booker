class PassengerMailer < ApplicationMailer
  default from: "noreply@flight-booker-odin.fly.dev"
  layout 'mailer'

  def ticket_email
    @passenger = params[:passenger]
    @flight = params[:flight]
    mail(to: @passenger.email, subject: '[OdinFlightBooker] Flight Booked')
  end
end
