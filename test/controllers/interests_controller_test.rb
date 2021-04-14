require "test_helper"

class InterestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interest = create(:interest)
    @interest_group = @interest.interest_group
    login
  end

  test "should get index" do
    get interests_url
    assert_response :success
  end

  test "should get the interest group's index" do
    get interest_group_interests_url(@interest_group)
    assert_response :success
  end

  test "should get new" do
    get new_interest_group_interest_url(@interest_group)
    assert_response :success
  end

  test "should create interest" do
    params = {
      interest: {
        interest_group_id: @interest.interest_group_id,
        position: @interest.position,
        value: @interest.value
      }
    }
    assert_difference('Interest.count') do
      post interest_group_interests_url(@interest_group), params: params
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
    params = {
      interest: {
        interest_group_id: @interest.interest_group_id,
        position: @interest.position,
        value: @interest.value
      }
    }
    patch interest_url(@interest), params: params
    assert_redirected_to interest_url(@interest)
  end

  test "should destroy interest" do
    assert_difference('Interest.count', -1) do
      delete interest_url(@interest)
    end

    assert_redirected_to interest_group_interests_url(@interest_group)
  end
end
