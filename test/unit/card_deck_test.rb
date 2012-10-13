require 'test_helper'

class CardDeckTest < TestHelper
  setup do
    @user = User.new(:email => 'bob@example.com', :password => '32ed3212s')
    @user.save!
  end

  test "should require a user" do
    card_deck = CardDeck.new()
    assert_raise(Ripple::DocumentInvalid) do
      card_deck.save!
    end

    card_deck.user_key = @user
    assert card_deck.save!
  end

  test "should create card deck" do
    card_deck = CardDeck.new(:user => @user)
    assert_kind_of CardDeck, card_deck
  end
end

