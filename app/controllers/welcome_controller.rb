class WelcomeController < ApplicationController
  def index
<<<<<<< HEAD
    @public_decks = CardDeck.public_decks
=======
    # @card_decks = CardDeck.find_by_index(:user_key, session[:current_user].key)
>>>>>>> e49deeb54377137674b238da34cede8fe473b6ea
  end
end
