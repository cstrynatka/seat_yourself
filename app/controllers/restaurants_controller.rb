class RestaurantsController < ApplicationController
	before_filter :ensure_logged_in, only: [:create, :destroy]
	#before_filter :load_product

	def new
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def create
		@restaurant = @user.restaurants.build(restaurant_params)
		@restaurant.user = current.user
			if @restaurant.save
				redirect_to user_path, notice: "Restaurant picked!"
			else
				render 'users/show'
			end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
	end

	private
		def reservation_params
			params.require(:restaurant).permit(:date, :time, :party_size, :reservations, :user)
		end
end

