class User
  include Ripple::Document
  include ActiveModel::SecurePassword

  property :email, String, index: true
  key_on :email

  property :password_digest, String, presence: true
  timestamps!

  has_secure_password
  many :card_decks, :class_name => "CardDeck"
  
  def self.all
    User.find_by_index('$bucket','_')
  end
end
