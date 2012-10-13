require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  setup do
    @answer = 'UPPER lower 123'

    @user = User.create email: 'asdf@example.invalid', password: 'asdf'
    @deck = CardDeck.create user_key: @user.key, name: 'test deck', description: 'asdf'
    @card = Card.create card_deck_key: @deck.key, question: 'what', answer: @answer

    @other_card = Card.create card_deck_key: @deck.key, question: 'ever', answer: 'ddd'
  end

  test 'should find a correct answer and have a next card' do
    @review = Review.new card_key: @card.key, answer: @answer
    assert @review.correct?

    assert_equal @other_card, @review.next
  end

  test 'should be capitalization picky' do
    @review = Review.new card_key: @card.key, answer: @answer.downcase
    assert !@review.correct?
  end
end