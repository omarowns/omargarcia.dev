require "application_system_test_case"

class LocationProxiesTest < ApplicationSystemTestCase
  setup do
    @location_proxy = create(:location_proxy)
    @location_group = @location_proxy.parent
  end

  test "visiting the index" do
    visit location_group_location_proxies_url(@location_group)
    assert_selector "h1", text: "Location Proxies"
  end

  test "creating a Location proxy" do
    visit location_group_location_proxies_url(@location_group)
    click_on "New Location Proxy"

    fill_in "Location", with: @location_proxy.location_id
    fill_in "Parent", with: @location_proxy.parent_id
    fill_in "Parent type", with: @location_proxy.parent_type
    fill_in "Position", with: @location_proxy.position
    click_on "Create Location proxy"

    assert_text "Location proxy was successfully created"
    click_on "Back"
  end

  test "updating a Location proxy" do
    visit location_group_location_proxies_url(@location_group)
    click_on "Edit", match: :first

    fill_in "Location", with: @location_proxy.location_id
    fill_in "Parent", with: @location_proxy.parent_id
    fill_in "Parent type", with: @location_proxy.parent_type
    fill_in "Position", with: @location_proxy.position
    click_on "Update Location proxy"

    assert_text "Location proxy was successfully updated"
    click_on "Back"
  end

  test "destroying a Location proxy" do
    visit location_group_location_proxies_url(@location_group)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location proxy was successfully destroyed"
  end
end
