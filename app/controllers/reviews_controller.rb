class ReviewsController < ApplicationController
  helper_method :card, :deck

  def show
    @review = Review.new card_key: params[:id]
  end

  def update
    @review = Review.new card_key: params[:id], answer: params[:review][:answer]
    if @review.correct?
      flash[:success] = 'Great Job!'
    else
      flash[:incorrect] = "Let's try again."
    end
    redirect_to id: @review.next
  end

  private
  def card
    @card ||= Card.find params[:id]
  end

  def deck
    card.card_deck
  end
end
