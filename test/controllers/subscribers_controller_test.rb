require "test_helper"

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subscribers_index_url
    assert_response :success
  end
end
