class ReservationsController < ApplicationController
	before_filter :ensure_logged_in, only: [:create, :destroy]
	#before_filter :load_product

	def show
		@reservation = Reservation.find(params[:id])
	end

	def create
		@reservation = @user.reservations.build(reservation_params)
		@reservation.user = current.user
			if @reservation.save
				redirect_to user_path, notice: "Reservation created successfully!"
			else
				render 'users/show'
			end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
	end

	private
		def reservation_params
			params.require(:reservation).permit(:date, :time, :party_size, :restaurant, :user)
		end
end
