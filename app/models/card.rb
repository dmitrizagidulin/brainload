class Card
  include Ripple::Document
  property :card_deck_key, String, presence: true, index: true
  property :created_at, Time
  property :question, String, presence: true, index: true
  property :answer, String, presence: true, index: true

  timestamps!

  one :card_deck, using: :stored_key
end

