require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    create(:user_with_player)
    create(:profile, type: 'mx')
    create(:profile, type: 'dev')
  end

  test "should get mx root" do
    get root_path
    assert_response :success
  end

  test "should get dev root" do
    get root_path
    assert_response :success
  end
end
