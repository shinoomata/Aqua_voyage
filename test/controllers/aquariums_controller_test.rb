require "test_helper"

class AquariumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aquariums_index_url
    assert_response :success
  end

  test "should get show" do
    get aquariums_show_url
    assert_response :success
  end
end
