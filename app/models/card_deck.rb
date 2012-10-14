class CardDeck
  include Ripple::Document

  property :name, String, presence: true, index: true
  property :description, String, presence: true, index: true
  property :user_key, String, presence: true, index: true
  property :category_key, String, index: true
  
  # deck_type is one of ['public', 'private']
  property :deck_type, String, index: true, default: 'private'
  
  timestamps!

  one :user, using: :stored_key
  one :category, using: :stored_key
  
  def empty?
    cards.empty?
  end

  def cards
    Card.find_by_index(:card_deck_key, self.key)
  end
  
  def public?
    !self.private?
  end

  def private?
    self.deck_type == 'private' or self.deck_type.nil?
  end

  def self.public_decks
		CardDeck.find_by_index('deck_type','public')
  end
  
  
  def self.all
    CardDeck.find_by_index('$bucket','_')
  end
end