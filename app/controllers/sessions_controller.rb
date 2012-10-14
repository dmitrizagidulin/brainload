class SessionsController < ApplicationController
  def new
  end

  def create_from_callback
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:current_user] = user.key
    if auth['email'] || user.email.match(/@/)
      redirect_to '/'
    else
      redirect_to '/add_email/' + auth['uid']
    end
  end
  def add_email
   if params[:email] && session[:current_user]
     user = User.find_by_index(:uid, session[:current_user]).first
     user.email = params[:email]
     if user.save!
       session[:current_user] = params[:email]
       redirect_to '/', :notice => "Signed in!"
     end
   end
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
				redirect_to '/'
			else
				redirect_to login_url, alert: "Invalid user/password combination"
			end
		end
	end

	def destroy
		session.delete(:current_user)
		redirect_to '/', alert: "Logged out."
	end
end
