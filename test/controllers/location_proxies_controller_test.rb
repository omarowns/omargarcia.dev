require "test_helper"

class LocationProxiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_proxy = create(:location_proxy)
    @location_group = @location_proxy.parent
  end

  test "should get index" do
    get location_group_location_proxies_url(@location_group)
    assert_response :success
  end

  test "should get new" do
    get new_location_group_location_proxy_url(@location_group)
    assert_response :success
  end

  test "should create location_proxy" do
    assert_difference('LocationProxy.count') do
      post location_group_location_proxies_url(@location_group), params: { location_proxy: { location_id: @location_proxy.location_id, parent_id: @location_proxy.parent_id, parent_type: @location_proxy.parent_type, position: @location_proxy.position } }
    end

    assert_redirected_to location_proxy_url(LocationProxy.last)
  end

  test "should show location_proxy" do
    get location_proxy_url(@location_proxy)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_proxy_url(@location_proxy)
    assert_response :success
  end

  test "should update location_proxy" do
    patch location_proxy_url(@location_proxy), params: { location_proxy: { location_id: @location_proxy.location_id, parent_id: @location_proxy.parent_id, parent_type: @location_proxy.parent_type, position: @location_proxy.position } }
    assert_redirected_to location_proxy_url(@location_proxy)
  end

  test "should destroy location_proxy" do
    assert_difference('LocationProxy.count', -1) do
      delete location_proxy_url(@location_proxy)
    end

    assert_redirected_to location_group_location_proxies_url(@location_group)
  end
end
