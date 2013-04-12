require 'test_helper'

class DisplayControllerTest < ActionController::TestCase
  test "should get movie" do
    get :movie
    assert_response :success
  end

  test "should get song" do
    get :song
    assert_response :success
  end

  test "should get book" do
    get :book
    assert_response :success
  end

end
