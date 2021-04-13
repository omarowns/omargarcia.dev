require "application_system_test_case"

class ImageProxiesTest < ApplicationSystemTestCase
  setup do
    @image_proxy = create(:image_proxy)
    @image = create(:image)
  end

  test "visiting the index" do
    visit image_proxies_url
    assert_selector "h1", text: "Image Proxies"
  end

  test "creating a Image proxy" do
    visit image_proxies_url
    click_on "New Image Proxy"

    check "Main" if @image_proxy.main
    check "Featured" if @image_proxy.featured
    fill_in "Position", with: (@image_proxy.position + 1)
    fill_in "Imageable", with: @image_proxy.imageable_id
    fill_in "Imageable type", with: @image_proxy.imageable_type
    # fill_in "Image", with: @image.id
    click_on "Create Image proxy"

    assert_text "Image proxy was successfully created"
  end

  test "updating a Image proxy" do
    visit image_proxies_url
    click_on "Edit", match: :first

    check "Featured" if @image_proxy.featured
    fill_in "Imageable", with: @image_proxy.imageable_id
    fill_in "Imageable type", with: @image_proxy.imageable_type
    check "Main" if @image_proxy.main
    fill_in "Position", with: (@image_proxy.position + 1)
    click_on "Update Image proxy"

    assert_text "Image proxy was successfully updated"
  end

  test "destroying a Image proxy" do
    visit image_proxies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Image proxy was successfully destroyed"
  end
end
