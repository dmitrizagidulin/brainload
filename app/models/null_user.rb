class NullUser
  def card_decks
    []
  end
  
  def allowed_deck(key)
    candidate = CardDeck.find key
    return candidate if candidate.deck_type == 'public'
    return nil
  end

  def allowed_card(key)
    candidate = Card.find key
    deck = candidate.card_deck

    return candidate if deck.deck_type == 'public'
    return
  end
end