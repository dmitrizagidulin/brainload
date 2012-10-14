class CardDeck
  include Ripple::Document

  property :name, String, presence: true, index: true
  property :description, String, presence: true, index: true
  property :user_key, String, presence: true, index: true
  property :category_key, String, index: true, default: Category.uncategorized_key
  
  # deck_type is one of ['public', 'private']
  property :deck_type, String, index: true, default: 'private'
  
  timestamps!

  one :user, using: :stored_key
  one :category, using: :stored_key

  UNIT_SEPARATOR = " "

  index :user_key, String do
    [user_key, key].join UNIT_SEPARATOR
  end

  def self.find_for_user_and_key(user, key)
    user = user.key if user.is_a? User
    candidates = find_by_index(:user_key, [user, key].join(UNIT_SEPARATOR))
    return candidates.first
  end
  
  def empty?
    cards.empty?
  end

  def cards
    Card.find_by_index(:card_deck_key, self.key)
  end
  
  def category
    if self.category_key.nil? or self.category_key.empty?
      return Category.uncategorized_key
    else
      return self.category_key
    end
  end
  
  def category_name
    Category.name_for_key(self.category)
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