class User
  include Ripple::Document
  include ActiveModel::SecurePassword

  property :email, String, index: true
  key_on :email
  property :provider, String, index: true
  property :uid, String, index: true
  property :name, String, index: true

  property :password_digest, String, presence: true
  timestamps!

  has_secure_password
  many :card_decks, :class_name => "CardDeck"
<<<<<<< HEAD

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
    p "user found:" + user.inspect
    user
=======
  
  def self.all
    User.find_by_index('$bucket','_')
>>>>>>> origin/categories
  end
end
