require 'test_helper'

class EuvouControllerTest < ActionController::TestCase
  test "should get confirmation" do
    get :confirmation
    assert_response :success
  end

end
