require "application_system_test_case"

class LocationProxiesTest < ApplicationSystemTestCase
  setup do
    @location_proxy = create(:location_proxy)
    @location_group = @location_proxy.locatable
    @image = create(:image)
    @work = create(:work)
  end

  test "visiting the index" do
    visit location_proxies_url(@location_group)
    assert_selector "h1", text: "Location Proxies"
  end

  test "creating a Location proxy" do
    visit location_proxies_url(@location_group)
    click_on "New Location Proxy"

    select @location_proxy.location.value, from: "Location"
    fill_in "Locatable", with: @location_proxy.locatable_id
    fill_in "Locatable type", with: @location_proxy.locatable_type
    fill_in "Position", with: (@location_proxy.position + 1)
    click_on "Create Location proxy"

    assert_text "Location proxy was successfully created"
  end

  test "updating a Location proxy" do
    visit location_proxies_url
    click_on "Edit", match: :first

    fill_in "Position", with: (@location_proxy.position + 1)
    click_on "Update Location proxy"

    assert_text "Location proxy was successfully updated"
    click_on "Back"
  end

  test "destroying a Location proxy" do
    visit location_proxies_url(@location_group)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location proxy was successfully destroyed"
  end

  test "creating a Work Location proxy" do
    visit works_url
    click_on "Edit", match: :first
    click_on "New Location Proxy"

    select @location_proxy.location.value, from: "Location"
    fill_in "Position", with: (@location_proxy.position + 1)
    click_on "Create Location proxy"

    assert_text "Location proxy was successfully created"
  end

  test "creating a Location Group Location proxy" do
    visit location_groups_url
    click_on "Edit", match: :first
    click_on "New Location Proxy"

    select @location_proxy.location.value, from: "Location"
    fill_in "Position", with: (@location_proxy.position + 1)
    click_on "Create Location proxy"

    assert_text "Location proxy was successfully created"
  end
end
