require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do

  end

  def users
    user_count = User.list()
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
  
  test "should create user" do
  	user_count = users.length
    post :create, :user => { :email => "test_unit@unittest.com",
                              :password => "test123" }
    assert users.length > user_count
    assert_redirected_to users_path
  end
end
