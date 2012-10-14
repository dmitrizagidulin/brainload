class WelcomeController < ApplicationController
  def index
<<<<<<< HEAD
    # @card_decks = CardDeck.find_by_index(:user_key, session[:current_user].key)
=======
    @public_decks = CardDeck.public_decks
>>>>>>> origin/categories
  end
end
