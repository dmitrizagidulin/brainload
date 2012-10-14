class ReviewsController < ApplicationController
  before_filter :require_card
  helper_method :review, :card, :deck

  def show
  end

  def update
  end

  private
  def require_card
    redirect_to home_path unless card
  end

  def review
    review_attrs = params[:review] || {}
    @review ||= Review.new review_attrs.merge(card_key: params[:id], user: equivalent_user)
  end

  def card
    @card ||= review.card
  end

  def deck
    card.card_deck
  end
end
