require "test_helper"

class WebinarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get webinars_index_url
    assert_response :success
  end
end
