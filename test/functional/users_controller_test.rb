require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @existing_user = User.create email: 'test@example.invalid', password: '12345'
  end

  def users
    user_count = User.all
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert assigns(:users)
  end
  
  test "should get new" do
    session[:current_user] = nil
    get :new
    assert_response :success
  end
  
  test "should create user" do
    session[:current_user] = nil
    user_count = users.length
    post :create, :user => { :email => "test_unit@unittest.com",
      :password => "test123",
      :password_confirmation => "test123"}
#    assert users.length > user_count
    assert_redirected_to users_path
  end
end
