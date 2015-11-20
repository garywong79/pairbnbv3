class ReservationsController < ApplicationController
	

	def create
		@list = List.find_by(params[:id])
		@reservation = @list.reservations.new(reservation_params)
		# @reservation.id = current_user.id
		current_user.reservations << @reservation
		redirect_to root_path, notice: "Successfully Book"

		if @reservation.save 
			
			ReservationWorker.perform_in(10.seconds,current_user.id, @list.id, @reservation.id)
		else
			redirect_to root_path, notice: "Book Error!"
		end
	end

	private
	def reservation_params
		params.require(:reservation).permit(:check_in_date, :check_out_date)
	end
end
