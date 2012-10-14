class WelcomeController < ApplicationController
  def index
    @card_decks = equivalent_user.card_decks
    public_decks = CardDeck.public_decks
    @public_decks_by_category = public_decks.group_by(&:category_key)
    
    # Get a sorted list of only categories with public decks
    @public_categories = Category.all
    @public_categories = @public_categories.reject { |c| c unless @public_decks_by_category.has_key? c.key }
    @public_categories = @public_categories.sort_by { |c| c.name }
  end

  def home
    @user = User.find_by_index(:email, session[:current_user]).first
  end
end
