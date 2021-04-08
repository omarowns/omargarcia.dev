require "test_helper"

class InterestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interest = create(:interest)
    @interest_group = @interest.interest_group
  end

  test "should get index" do
    get interest_group_interests_url(@interest_group)
    assert_response :success
  end

  test "should get new" do
    get new_interest_group_interest_url(@interest_group)
    assert_response :success
  end

  test "should create interest" do
    assert_difference('Interest.count') do
      post interest_group_interests_url(@interest_group), params: { interest: { interest_group_id: @interest.interest_group_id, profile_position: @interest.profile_position, value: @interest.value } }
    end

    assert_redirected_to interest_url(Interest.last)
  end

  test "should show interest" do
    get interest_url(@interest)
    assert_response :success
  end

  test "should get edit" do
    get edit_interest_url(@interest)
    assert_response :success
  end

  test "should update interest" do
    patch interest_url(@interest), params: { interest: { interest_group_id: @interest.interest_group_id, profile_position: @interest.profile_position, value: @interest.value } }
    assert_redirected_to interest_url(@interest)
  end

  test "should destroy interest" do
    assert_difference('Interest.count', -1) do
      delete interest_url(@interest)
    end

    assert_redirected_to interest_group_interests_url(@interest_group)
  end
end
