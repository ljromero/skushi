require 'test_helper'

class ApiUserControllerTest < ActionController::TestCase
  test "should get get_post" do
    get :get_post
    assert_response :success
  end

  test "should get get_following" do
    get :get_following
    assert_response :success
  end

  test "should get get_followers" do
    get :get_followers
    assert_response :success
  end

end
