require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get hire" do
    get :hire
    assert_response :success
  end

  test "should get table" do
    get :table
    assert_response :success
  end

end
