require "test_helper"

class DilemmasControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dilemmas_show_url
    assert_response :success
  end
end
