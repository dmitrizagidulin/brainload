# Unused; use sessions_controller.rb for the moment. Leaving here for my own ActiveModel reference. --dz

class Login
	extend ActiveModel::Naming
	include ActiveModel::Conversion
	include ActiveModel::Validations

	attr_accessor :email, :password

	validates :email, presence: true

  def initialize(attributes = {})
    self.email = attributes[:email]
    self.password = attributes[:password]  
  end

	def login
		return nil unless valid?
    candidate = User.find email
    return nil unless candidate
    return candidate if candidate.authenticate(password)
	end
  
  def persisted?
    false
  end
end