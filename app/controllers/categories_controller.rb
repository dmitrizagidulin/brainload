class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end
	
	def show
		@category = Category.find(params[:id])
		if @category.nil?
			redirect_to '/'
		else
			@category_decks = @category.public_decks.sort_by {|deck| deck.name}
		end
	end
end