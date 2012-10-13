class ReviewsController < ApplicationController
  helper_method :review, :card, :deck

  def show
    @review = Review.new card_key: params[:id]
  end

  def update
    @review = Review.new card_key: params[:id], answer: params[:review][:answer]
  end

  private
  def review
    @review ||= Review.new({card_key: params[:id]}.merge params[:review])
  end

  def card
    @card ||= review.card
  end

  def deck
    card.card_deck
  end
end
