require 'test_helper'

class UserTest < TestHelper
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

  test 'find by provider and uid' do
    address = 'user-email@test.invalid'
    password = 'really secure password 12345'
    assert User.respond_to?(:find_by_provider_and_uid)
    User.new(:email => address,
             :password => password,
             :provider => "twitter",
             :uid => "092j3doiqliou3h2878932").save!

    user = User.find_by_provider_and_uid("twitter", "092j3doiqliou3h2878932")
    assert_kind_of User, user
    assert_equal "092j3doiqliou3h2878932", user.uid
  end
end
