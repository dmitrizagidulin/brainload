class Card
  include Ripple::Document
  property :card_deck_key, String, presence: true, index: true
  property :created_at, Time
  timestamps!

  one :card_deck, using: :stored_key

end

