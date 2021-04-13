require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    create(:profile, type: 'MX')
    create(:profile, type: 'DEV')
  end

  test "should get mx root" do
    get test_mx_root_path
    assert_response :success
  end

  test "should get dev root" do
    get test_dev_root_path
    assert_response :success
  end
end
