require "test_helper"

class LocationProxiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_proxy = create(:location_proxy)
    @location_group = @location_proxy.locatable
  end

  test "should get index" do
    get location_proxies_url
    assert_response :success
  end

  test "should get location group's index" do
    get location_proxies_url(@location_group)
    assert_response :success
  end

  test "should get new" do
    get new_location_proxy_url(@location_group)
    assert_response :success
  end

  test "should create location_proxy" do
    assert_difference('LocationProxy.count') do
      post location_proxies_url(@location_group), params: { location_proxy: { location_id: @location_proxy.location_id, locatable_id: @location_proxy.locatable_id, locatable_type: @location_proxy.locatable_type, position: @location_proxy.position } }
    end

    assert_redirected_to location_proxies_url
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
    patch location_proxy_url(@location_proxy), params: { location_proxy: { location_id: @location_proxy.location_id, locatable_id: @location_proxy.locatable_id, locatable_type: @location_proxy.locatable_type, position: @location_proxy.position } }
    assert_redirected_to location_proxy_url(@location_proxy)
  end

  test "should destroy location_proxy" do
    assert_difference('LocationProxy.count', -1) do
      delete location_proxy_url(@location_proxy)
    end

    assert_redirected_to location_proxies_url
  end
end
