class User
  include Ripple::Document
  
  property :email, String, presence: true
end
