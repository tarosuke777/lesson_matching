require "test_helper"

class Teachers::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teachers_home_index_url
    assert_response :success
  end
end
