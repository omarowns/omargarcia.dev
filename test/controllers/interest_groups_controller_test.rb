require "test_helper"

class InterestGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interest_group = create(:interest_group)
  end

  test "should get index" do
    get interest_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_interest_group_url
    assert_response :success
  end

  test "should create interest_group" do
    assert_difference('InterestGroup.count') do
      post interest_groups_url, params: { interest_group: { profile_id: @interest_group.profile_id, title: @interest_group.title } }
    end

    assert_redirected_to interest_group_url(InterestGroup.last)
  end

  test "should show interest_group" do
    get interest_group_url(@interest_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_interest_group_url(@interest_group)
    assert_response :success
  end

  test "should update interest_group" do
    patch interest_group_url(@interest_group), params: { interest_group: { profile_id: @interest_group.profile_id, title: @interest_group.title } }
    assert_redirected_to interest_group_url(@interest_group)
  end

  test "should destroy interest_group" do
    assert_difference('InterestGroup.count', -1) do
      delete interest_group_url(@interest_group)
    end

    assert_redirected_to interest_groups_url
  end
end
