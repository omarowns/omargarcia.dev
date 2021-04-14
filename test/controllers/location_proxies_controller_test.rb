require "test_helper"

class LocationProxiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_proxy = create(:location_proxy)
    @locatable = @location_proxy.locatable
  end

  test "should get index" do
    get location_proxies_url
    assert_response :success
  end

  test "should get locatable's index" do
    get location_proxies_url(@locatable)
    assert_response :success
  end

  test "should get new" do
    get new_location_proxy_url
    assert_response :success
  end

  test "should get new for locatable" do
    get new_location_proxy_url(@locatable)
    assert_response :success
  end

  test "should create location_proxy" do
    params = {
      location_proxy: {
        location_id: @location_proxy.location_id,
        locatable_id: @location_proxy.locatable_id,
        locatable_type: @location_proxy.locatable_type,
        position: (@location_proxy.position + 1)
      }
    }
    assert_difference('LocationProxy.count') do
      post location_proxies_url, params: params
    end

    assert_redirected_to @locatable
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
    params = {
      location_proxy: {
        location_id: @location_proxy.location_id,
        locatable_id: @location_proxy.locatable_id,
        locatable_type: @location_proxy.locatable_type,
        position: (@location_proxy.position + 1)
      }
    }
    patch location_proxy_url(@location_proxy), params: params
    assert_redirected_to @locatable
  end

  test "should destroy location_proxy" do
    assert_difference('LocationProxy.count', -1) do
      delete location_proxy_url(@location_proxy)
    end

    assert_redirected_to @locatable
  end
end
