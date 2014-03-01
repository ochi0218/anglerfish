require 'test_helper'

class PrefControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
