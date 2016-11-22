require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get splashpage" do
    get :splashpage
    assert_response :success
  end

end
