class Card
  include Ripple::Document
  property :card_deck_key, String, presence: true, index: true
  property :created_at, Time
  property :question, String, presence: true, index: true
  property :answer, String, presence: true, index: true

  timestamps!

  one :card_deck, using: :stored_key
  
  UNIT_SEPARATOR = " "

  index :user_key, String do
    [card_deck.user_key, key].join(UNIT_SEPARATOR)
  end

  def self.find_for_user_and_key(user, key)
    user = user.key if user.is_a? User
    candidates = find_by_index(:user_key, [user, key].join(UNIT_SEPARATOR))
    return candidates.first
  end

  def self.all
    Card.find_by_index('$bucket','_')
  end
end

