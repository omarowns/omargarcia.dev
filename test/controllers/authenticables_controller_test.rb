require "test_helper"

class AuthenticablesControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get authenticables_destroy_url
    assert_response :success
  end
end
