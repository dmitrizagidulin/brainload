class CardDeck
  include Ripple::Document

  property :user_key, String, presence: true, index: true
  timestamps!

  one :user, using: :stored_key
end