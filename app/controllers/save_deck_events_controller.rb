class SaveDeckEventsController < ApplicationController
  def create
    card_deck_key = params[:id]
    save_event = SaveDeckEvent.new(user_key: current_user, card_deck_key: card_deck_key)
    save_event.save!
    redirect_to '/home'
  end
end
