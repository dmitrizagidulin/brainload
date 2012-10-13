class SessionsController < ApplicationController
  def new
  end

	def create
		user = nil
		matches = User.find_by_index(:email, params[:email])
		if matches
			user = matches.first
		end
		if user and user.authenticate(params[:password])
			session[:user_key] = user.key
			redirect_to '/home'
		else
			redirect_to login_url, alert: "Invalid user/password combination"
		end
	end

	def destroy
		session[:user_key] = nil
		redirect_to '/', notice: "Logged out."
	end
end
