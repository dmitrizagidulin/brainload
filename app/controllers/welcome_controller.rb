class WelcomeController < ApplicationController
  def index
    if session[:current_user]
      user = User.find_by_index(:email, session[:current_user]).first
      @card_decks = user ? user.card_decks : []
    end
    @public_decks = CardDeck.public_decks
  end

  def home
    @user = User.find_by_index(:email, session[:current_user]).first
  end
end
