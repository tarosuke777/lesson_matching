require "test_helper"

class ReservationFramesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservation_frames_index_url
    assert_response :success
  end

  test "should get create" do
    get reservation_frames_create_url
    assert_response :success
  end
end
