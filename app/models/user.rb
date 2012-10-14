class User
  include Ripple::Document
  include ActiveModel::SecurePassword

  property :email, String, index: true
  key_on :email
  property :provider, String, index: true
  property :uid, String, index: true, default: proc { SecureRandom.uuid }
  property :name, String, index: true

  property :password_digest, String, presence: true
  timestamps!

  has_secure_password

  def card_decks
    CardDeck.find_by_index(:user_key, self.key)
  end

  def allowed_deck(key)
    candidate = CardDeck.find key
    return candidate if candidate.user_key == self.key
    return candidate if candidate.deck_type == 'public'
    return nil
  end

  def allowed_card(key)
    candidate = Card.find key
    deck = candidate.card_deck

    return candidate if deck.user_key == self.key
    return candidate if deck.deck_type == 'public'
    return nil
  end  

  def self.create_with_omniauth(auth)
    user = User.create(:provider => auth["provider"],
           :uid => auth["uid"],
           :name => auth["info"]["name"],
           :email => auth["uid"],
           :password => auth["uid"]
    )
    user.save!
    user
  end

  def self.find_by_provider_and_uid(provider, uid)
    user = User.find_by_index(:uid, uid).collect{|u| u if u.provider == provider}.compact.first
    user
  end

  def self.all
    User.find_by_index('$bucket','_')
  end
end
