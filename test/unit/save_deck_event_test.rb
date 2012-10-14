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
end
