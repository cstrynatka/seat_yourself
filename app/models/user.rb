class User < ActiveRecord::Base
	has_many :restaurants, through: :reservations
	has_many :reservations
	has_many :owned_restaurants, class_name: "Restaurant"
end
