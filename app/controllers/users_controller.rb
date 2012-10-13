class UsersController < ApplicationController
	def create
		@user = User.new(params[:user])
			
		respond_to do |format|
			if @user.save
				format.html { redirect_to users_url,
					notice: "User #{@user.email} created." }
				format.json { render json: @user,
					status: :created, location: @user }
			else
				format.html { render action: "new" }
				format.json { render json: @user.errors,
					status: :unprocessable_entity }
			end 
		end
	end
	
	def index
		@users = User.list()
	end
	
	def new
		@user = User.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @user }
		end
	end
end
