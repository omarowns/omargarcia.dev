require "test_helper"

class ImageProxiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_proxy = create(:image_proxy)
    @imageable = @image_proxy.imageable
  end

  test "should get index" do
    get image_proxies_url
    assert_response :success
  end

  test "should get imageable's index" do
    get image_proxies_url(@imageable)
    assert_response :success
  end

  test "should get new" do
    get new_image_proxy_url
    assert_response :success
  end

  test "should get new for imageable" do
    get new_image_proxy_url(@imageable)
    assert_response :success
  end

  test "should create image_proxy" do
    params = {
      image_proxy: {
        featured: @image_proxy.featured,
        image_id: @image_proxy.image_id,
        imageable_id: @image_proxy.imageable_id,
        imageable_type: @image_proxy.imageable_type,
        main: @image_proxy.main,
        position: (@image_proxy.position + 1)
      }
    }
    assert_difference('ImageProxy.count') do
      post image_proxies_url, params: params
    end

    assert_redirected_to @imageable
  end

  test "should show image_proxy" do
    get image_proxy_url(@image_proxy)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_proxy_url(@image_proxy)
    assert_response :success
  end

  test "should update image_proxy" do
    params = {
      image_proxy: {
        featured: @image_proxy.featured,
        image_id: @image_proxy.image_id,
        imageable_id: @image_proxy.imageable_id,
        imageable_type: @image_proxy.imageable_type,
        main: @image_proxy.main,
        position: (@image_proxy.position + 1)
      }
    }
    patch image_proxy_url(@image_proxy), params: params
    assert_redirected_to @imageable
  end

  test "should destroy image_proxy" do
    assert_difference('ImageProxy.count', -1) do
      delete image_proxy_url(@image_proxy)
    end

    assert_redirected_to @imageable
  end
end
