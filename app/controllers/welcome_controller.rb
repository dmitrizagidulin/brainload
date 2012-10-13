class WelcomeController < ApplicationController
  def index
    @card_decks = CardDeck.find_by_index(:user_key, current_user.key)
  end
end
