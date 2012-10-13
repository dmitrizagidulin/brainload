class UsersController < ApplicationController
	def create
		@user = User.new(params[:user])
			
		respond_to do |format|
			if @user.save
				format.html { redirect_to users_url,
					notice: "User #{@user.name} created." }
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
		@users = User.find_by_index(:email, '_')
	end
end
