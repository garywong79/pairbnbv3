class ReservationsController < ApplicationController
	

	def create
		@list = List.find_by(params[:id])
		@reservation = @list.reservations.create(reservation_params)
		current_user.reservations << @reservation
		redirect_to root_path, notice: "Successfully Book"
	end

	private
	def reservation_params
		params.require(:reservation).permit(:check_in_date, :check_out_date)
	end
end
