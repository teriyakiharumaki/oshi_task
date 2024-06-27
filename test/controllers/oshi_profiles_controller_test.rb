require "test_helper"

class OshiProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get oshi_profiles_edit_url
    assert_response :success
  end

  test "should get update" do
    get oshi_profiles_update_url
    assert_response :success
  end
end
