class ReviewsController < ApplicationController
  before_filter :require_card
  helper_method :review, :card, :deck

  def show
    @review = Review.new card_key: params[:id]
  end

  def update
    @review = Review.new card_key: params[:id], answer: params[:review][:answer]
  end

  private
  def require_card
    redirect_to home_path unless card
  end

  def review
    review_attrs = {card_key: params[:id], user: equivalent_user}.reverse_merge params[:review]
    @review ||= Review.new review_attrs
  end

  def card
    @card ||= review.card
  end

  def deck
    card.card_deck
  end
end
