class SessionsController < ApplicationController
  
  def new
  	@session = Session.new
  end

  def create
  	session[:user_id] = @current_user.id
  	User.find(session[:user_id])
  end

end
