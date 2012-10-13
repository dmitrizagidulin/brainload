class User
  include Ripple::Document
  include ActiveModel::SecurePassword
  
  property :email, String, presence: true

  has_secure_password
end
