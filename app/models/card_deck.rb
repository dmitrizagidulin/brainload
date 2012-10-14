class CardDeck
  include Ripple::Document

  property :name, String, presence: true, index: true
  property :description, String, presence: true, index: true
  property :user_key, String, presence: true, index: true
	property :category_key, String, index: true
  timestamps!

  one :user, using: :stored_key
  one :category, using: :stored_key
  
  def cards
    Card.find_by_index(:card_deck_key, self.key)
  end
end