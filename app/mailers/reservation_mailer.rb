class ReservationMailer < ApplicationMailer
	def booking_email(customer, host, reservation_id)
		
		#current_usert, @list = host
		@customer = customer
		@host = host
		
		mail(to: @host.user.email, subject: "you have received a booking from #{@customer.name}....")
	end

end
