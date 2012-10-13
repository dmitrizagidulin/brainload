class CardDeck
  include Ripple::Document

  property :user_key, String, presence: true, index: true
  timestamps!

  one :user, using: :stored_key

  def cards
    Card.find_by_index(:card_deck_key, self.key)
  end
end