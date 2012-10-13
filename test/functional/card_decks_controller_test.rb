require 'test_helper'

class CardDecksControllerTest < ActionController::TestCase
  setup do
    @user = User.new(:email => "bob@example.com", :password => "2asxlkwme")
    @user.save!
    @card_deck = CardDeck.new(:user_key => @user.key,
                              :name => "Learn German",
                              :description => "sample set of questions")
    @card_deck.save!
    @card = Card.new(:card_deck_key => @card_deck.key,
                     :question => "this is a question",
                     :answer => "this is an answer")
    @card.save!
  end

  def decks
    CardDeck.find_by_index(:user_key, @user.key)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_deck" do
    deck_count = decks.length
    post :create, :card_deck => { :user_key => @user.key,
                                  :name => "Learn German",
                                  :description => "sample set of questions"  }
    assert decks.length > deck_count
    assert_redirected_to card_deck_path(assigns(:card_deck))
  end

  test "should show card_deck" do
    get :show, id: @card_deck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_deck
    assert_response :success
  end

  test "should update card_deck" do
    put :update, id: @card_deck, card_deck: {  }
    assert_redirected_to card_deck_path(assigns(:card_deck))
  end

  test "should destroy card_deck" do
    deck_count = decks.length
    delete :destroy, id: @card_deck
    assert decks.length < deck_count

    assert_redirected_to card_decks_path
  end
end
