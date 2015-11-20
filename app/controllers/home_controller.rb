class HomeController < ApplicationController
	def index
		@user = User.all
		@list = List.all
		if logged_in?  
			@reservation = Reservation.new
		end
	end
end
