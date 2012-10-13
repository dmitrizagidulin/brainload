require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user email' do
  	address = 'user-email@test.invalid'

  	u = User.new email: address

  	assert_equal address, u.email
  end

  test 'secure password' do
  	address = 'user-email@test.invalid'
  	password = 'really secure password 12345'

  	u = User.new email: address, password: password
  	assert u.save

	assert User.find(address).authenticate(password)
  end
end
