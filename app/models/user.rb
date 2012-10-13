class User
  include Ripple::Document
  include ActiveModel::SecurePassword

  property :email, String
  key_on :email
  
  property :password_digest, String, presence: true

  has_secure_password
end
