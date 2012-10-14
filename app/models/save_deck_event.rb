class SaveDeckEvent
  include Ripple::Document
  
  property :user_key, String, presence: true, index: true
  property :card_deck_key, String, presence: true, index: true
  
  one :card_deck, using: :stored_key
	one :user, using: :stored_key
  
  timestamps!
  
end
