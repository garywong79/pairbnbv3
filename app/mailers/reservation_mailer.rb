class ReservationMailer < ApplicationMailer
	def booking_email(custoer, host)
		@host = host
		@customer = customer

		mail(to: @host.email, subject: "you have ....")
	end

end
