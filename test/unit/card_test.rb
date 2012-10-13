require 'test_helper'

class CardTest < TestHelper
  def setup
    user = User.new(:email => 'bob@example.com', :password => '32ed3212s')
    user.save!
    @card_deck = CardDeck.new(:user_key => user.key)
    @card_deck.save!
  end
  test "should require values" do
    card = Card.new()

    assert_raise(Ripple::DocumentInvalid) do
      card.save!
    end
    card = Card.new(:card_deck_key => @card_deck.key,
                    :question => "this is a question",
                    :answer => "this is an answer")
    assert_nil card.key

    assert_nothing_raised do
      card.save!
    end

    assert_not_nil card.key
    assert_equal "this is a question", card.question
    assert_equal "this is an answer", card.answer
  end


end


