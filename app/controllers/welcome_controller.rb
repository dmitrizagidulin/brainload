class WelcomeController < ApplicationController
  def index
    @public_decks = CardDeck.public_decks
  end
end
