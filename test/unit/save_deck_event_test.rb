require 'test_helper'

class SaveDeckEventTest < ActiveSupport::TestCase
  setup do

  end

  test 'should require validation' do
    save_event = SaveDeckEvent.new
    assert_raise(Ripple::DocumentInvalid) do
      save_event.save!
    end
    
    save_event = SaveDeckEvent.new(user_key: '12345')
    assert_raise(Ripple::DocumentInvalid) do
      save_event.save!
    end
    
    save_event = SaveDeckEvent.new(card_deck_key: '456')
    assert_raise(Ripple::DocumentInvalid) do
      save_event.save!
    end
    
    user = User.new(:email => 'bob@example.com', :password => '32ed3212s')
    user.save!
    card_deck = CardDeck.all.first
    
    save_event = SaveDeckEvent.new(user_key: user, card_deck_key: card_deck)
     
    assert_nothing_raised do
      save_event.save!
    end
  end
  
  test 'should show up on user saved_decks, after saving' do
    user = User.all.first
    card_deck = CardDeck.all.first
    
		save_event = SaveDeckEvent.new(user_key: user.key, card_deck_key: card_deck.key)
		save_event.save!
		
  	user_saved_decks = user.saved_deck_keys
    assert_false user_saved_decks.nil? or user_saved_decks.empty?
    assert user_saved_decks.include? save_event.card_deck_key
    
    assert user.has_saved_deck(card_deck.key)
  end
end
