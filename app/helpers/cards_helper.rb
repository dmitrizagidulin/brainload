module CardsHelper
  def onward_button
    next_key = review.next
    return return_button if next_key.nil?

    link_to("\u23ce Onward!",
            review_path(next_key),
            class: 'btn btn-large',
            :'data-press-enter' => true
      )
  end

  def return_button
    link_to("\u23ce Return to Deck",
            card_deck_path(deck.key),
            class: 'btn btn-large',
            :'data-press-enter' => true
      )
  end
end
