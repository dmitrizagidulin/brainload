require 'test_helper'

class UserTest < TestHelper
  EMAIL = 'user-email@test.invalid'
  PASSWORD = 'really secure password 12345'

  test 'user email' do
  	u = User.new email: EMAIL
  	assert_equal EMAIL, u.email
  end

  test 'secure password' do
  	u = User.new email: EMAIL, password: PASSWORD
  	assert u.save
	  assert User.find(EMAIL).authenticate(PASSWORD)
  end

  test 'find by provider and uid' do
    assert User.respond_to?(:find_by_provider_and_uid)
    User.new(:email => EMAIL,
             :password => PASSWORD,
             :provider => "twitter",
             :uid => "092j3doiqliou3h2878932").save!

    user = User.find_by_provider_and_uid("twitter", "092j3doiqliou3h2878932")
    assert_kind_of User, user
    assert_equal "092j3doiqliou3h2878932", user.uid
  end

  test 'user creates uid by default' do
    user = User.new(:email => EMAIL,
                    :password => PASSWORD );
    assert_not_nil user.uid
    assert user.uid.length == 36
  end
end
