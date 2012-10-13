require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do

  end

  test "should get index" do
    get :index
    assert_response :success
    assert assigns(:users)
  end
end
