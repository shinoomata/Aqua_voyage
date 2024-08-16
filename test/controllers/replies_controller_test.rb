require "test_helper"

class RepliesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get replies_create_url
    assert_response :success
  end

  test "should get destroy" do
    get replies_destroy_url
    assert_response :success
  end
end
