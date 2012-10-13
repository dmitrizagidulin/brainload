require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do

  end

  test "should get index" do
    get :index
    assert_response :success
    assert assigns(:users)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
end
