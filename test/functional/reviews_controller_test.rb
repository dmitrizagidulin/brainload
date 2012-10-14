require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @answer = 'UPPER lower 123'

    @user = User.create email: 'asdf@example.invalid', password: 'asdf'
    @deck = CardDeck.create user_key: @user.key, name: 'test deck', description: 'asdf'
    @card = Card.create card_deck_key: @deck.key, question: 'what', answer: @answer

    @other_card = Card.create card_deck_key: @deck.key, question: 'ever', answer: 'ddd'
  end
  test "should get show" do
    session[:current_user] = @user.key
    get :show, id: @card.key
    assert_response :success
  end

end
