class SessionsController < ApplicationController
  def new
  end

	def create
		email = params[:email]
		password = params[:password]
		if email.nil? or password.nil?
			redirect_to login_url, alert: "Invalid user/password combination"
		else
			matches = User.find_by_index(:email, email)
			if matches
				user = matches.first
			end
			if user and user.authenticate(params[:password])
				session[:current_user] = user.key
				redirect_to '/home'
			else
				redirect_to login_url, alert: "Invalid user/password combination"
			end
		end
	end

	def destroy
		session[:current_user] = nil
		redirect_to '/', alert: "Logged out."
	end
end
