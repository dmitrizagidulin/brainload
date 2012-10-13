require 'test_helper'

class CardDeckTest < TestHelper
  setup do

  end

  test "should require a user" do
    user = User.new(:email => 'bob@example.com', :password => '32ed3212s')
    user.save!

    card_deck = CardDeck.new()
    assert_raise(Ripple::DocumentInvalid) do
      card_deck.save!
    end

    assert_nil card_deck.user
    assert_not_nil user
    card_deck.user_key = user.key
    card_deck.save!
    assert_not_nil card_deck.user_key
    assert_equal user.key, card_deck.user_key
    assert card_deck.save!
  end

  test "should create card deck" do
    user = User.new(:email => 'bob@example.com', :password => '32ed3212s')
    user.save!

    card_deck = CardDeck.new(:user => user)
    assert_kind_of CardDeck, card_deck

    assert retrieved_user = User.find(card_deck.user_key)
    assert_equal 'bob@example.com', retrieved_user.email
  end
end

