class UsersController < ApplicationController
	before_filter :require_no_user, only: [:new, :create]
	before_filter :require_user, only: [:home]
	
	def create
		unless params
			redirect_to login_url
		end
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
	
	def home
		@card_decks = CardDeck.find_by_index(:user_key, current_user.key)
	end
	
	def index
		@users = User.all
	end
	
	def new
		@user = User.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @user }
		end
	end
end
