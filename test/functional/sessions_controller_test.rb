require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should redirect to login page on a get session/create" do
    get :create
    assert_redirected_to login_url
  end

#  test "should fail to create session with no login" do
#    get :create
#    assert_redirected_to login_url
#  end
  
  test "should get destroy" do
    get :destroy
    assert_redirected_to '/'
  end

end
