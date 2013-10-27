require 'test_helper'

class PlivoControllerTest < ActionController::TestCase
  test "should get send_msg" do
    get :send_msg
    assert_response :success
  end

end
