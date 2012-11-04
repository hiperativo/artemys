require 'test_helper'

class PiecesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
