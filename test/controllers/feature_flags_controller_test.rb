require "test_helper"

class FeatureFlagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feature_flag = create(:feature_flag)
    login
  end

  test "should get index" do
    get feature_flags_url
    assert_response :success
  end

  test "should get new" do
    get new_feature_flag_url
    assert_response :success
  end

  test "should create feature_flag" do
    assert_difference('FeatureFlag.count') do
      post feature_flags_url, params: { feature_flag: { active: @feature_flag.active, description: @feature_flag.description, key: @feature_flag.key } }
    end

    assert_redirected_to feature_flag_url(FeatureFlag.last)
  end

  test "should show feature_flag" do
    get feature_flag_url(@feature_flag)
    assert_response :success
  end

  test "should get edit" do
    get edit_feature_flag_url(@feature_flag)
    assert_response :success
  end

  test "should update feature_flag" do
    patch feature_flag_url(@feature_flag), params: { feature_flag: { active: @feature_flag.active, description: @feature_flag.description, key: @feature_flag.key } }
    assert_redirected_to feature_flag_url(@feature_flag)
  end

  test "should destroy feature_flag" do
    assert_difference('FeatureFlag.count', -1) do
      delete feature_flag_url(@feature_flag)
    end

    assert_redirected_to feature_flags_url
  end
end
