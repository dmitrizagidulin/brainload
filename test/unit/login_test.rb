require 'test_helper'

class LoginTest < ActiveSupport::TestCase
  setup do
    @email = 'test-email@test.invalid'
    @password = 'really secure password 12345'
    @user = User.create email: @email, password: @password
  end

  test 'log in with right email and password' do
    l = Login.new email: @email, password: @password
    assert_equal @user, l.login
  end

  test 'not log in with right email and wrong password' do
    l = Login.new email: @email, password: 'wrong'
    assert !l.login
  end

  test 'not log in with wrong email' do
    l = Login.new email: 'wrongo@test.invalid', password: 'who cares'
    assert !l.login
  end
end