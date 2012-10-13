require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  setup do
    @user = User.new(:email => "bob@example.com", :password => "2asxlkwme")
    @user.save!
    @card_deck = CardDeck.new( :user_key => @user.key,
                              :name => "Learn German",
                              :description => "sample set of questions")
    @card_deck.save!
    @card = Card.new(:card_deck_key => @card_deck.key,
                     :question => "this is a question",
                     :answer => "this is an answer")
    @card.save!
  end
  def cards
    Card.find_by_index(:card_deck_key, @card_deck.key)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card" do
    card_count = cards.length
    post :create, :card => {:card_deck_key => @card_deck.key,
                            :question => "this is a question",
                            :answer => "this is an answer" }
    assert cards.length > card_count

    assert_redirected_to card_path(assigns(:card))
  end

  test "should show card" do
    get :show, id: @card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card
    assert_response :success
  end

  test "should update card" do
    put :update, id: @card, card: {  }
    assert_redirected_to card_path(assigns(:card))
  end

  test "should destroy card" do
    card_count = cards.length
    delete :destroy, id: @card
    assert cards.length < card_count

    assert_redirected_to cards_path
  end

end
