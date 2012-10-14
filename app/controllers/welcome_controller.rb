class WelcomeController < ApplicationController
  def index
    @card_decks = equivalent_user.card_decks
    @public_decks = CardDeck.public_decks
  end

  def home
    @user = User.find_by_index(:email, session[:current_user]).first
  end
end
