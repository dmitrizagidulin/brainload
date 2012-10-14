class UsersController < ApplicationController
	def index
		@categories = Category.all
	end
end