require "test_helper"

class ImageProxiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_proxy = create(:image_proxy)
  end

  test "should get index" do
    get image_proxies_url
    assert_response :success
  end

  test "should get new" do
    get new_image_proxy_url
    assert_response :success
  end

  test "should create image_proxy" do
    assert_difference('ImageProxy.count') do
      post image_proxies_url, params: { image_proxy: { featured: @image_proxy.featured, image_id: @image_proxy.image_id, imageable_id: @image_proxy.imageable_id, imageable_type: @image_proxy.imageable_type, main: @image_proxy.main, position: @image_proxy.position } }
    end

    assert_redirected_to image_proxy_url(ImageProxy.last)
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
    patch image_proxy_url(@image_proxy), params: { image_proxy: { featured: @image_proxy.featured, image_id: @image_proxy.image_id, imageable_id: @image_proxy.imageable_id, imageable_type: @image_proxy.imageable_type, main: @image_proxy.main, position: @image_proxy.position } }
    assert_redirected_to image_proxy_url(@image_proxy)
  end

  test "should destroy image_proxy" do
    assert_difference('ImageProxy.count', -1) do
      delete image_proxy_url(@image_proxy)
    end

    assert_redirected_to image_proxies_url
  end
end
