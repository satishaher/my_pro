require 'test_helper'

class DemoControllerTest < ActionController::TestCase
  test "should get ind1" do
    get :ind1
    assert_response :success
  end

  test "should get ind2" do
    get :ind2
    assert_response :success
  end

end
