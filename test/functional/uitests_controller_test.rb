require 'test_helper'

class UitestsControllerTest < ActionController::TestCase
  test "should get uitests" do
    get :uitests
    assert_response :success
  end

end
