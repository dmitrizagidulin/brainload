require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  setup do

  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
