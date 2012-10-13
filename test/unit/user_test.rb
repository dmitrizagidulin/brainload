require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user email' do
  	address = 'user-email@test.invalid'

  	u = User.new email: address

  	assert_equal address, u.email
  end
end
