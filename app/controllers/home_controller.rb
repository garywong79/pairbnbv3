class HomeController < ApplicationController
	def index
		@user = User.all
		@list = List.all
		if logged_in?  
			@reservation = Reservation.new
		end
	end

	def search
		List.reindex
		if params[:home][:search].present?
			
			@results = List.search params[:home][:search]
		else
			@results = List.all
		end
	end

end
