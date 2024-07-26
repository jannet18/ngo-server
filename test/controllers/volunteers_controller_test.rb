require "test_helper"

class VolunteersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get volunteers_create_url
    assert_response :success
  end
end
