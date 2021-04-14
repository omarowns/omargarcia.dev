require "application_system_test_case"

class LocationGroupsTest < ApplicationSystemTestCase
  setup do
    @location_group = create(:location_group)
    login
  end

  test "visiting the index" do
    visit location_groups_url
    assert_selector "h1", text: "Location Groups"
  end

  test "creating a Location group" do
    visit location_groups_url
    click_on "New Location Group"

    select @location_group.profile.type, from: "Profile"
    fill_in "Title", with: @location_group.title
    click_on "Create Location group"

    assert_text "Location group was successfully created"
    click_on "Back"
  end

  test "updating a Location group" do
    visit location_groups_url
    click_on "Edit", match: :first

    fill_in "Title", with: @location_group.title
    click_on "Update Location group"

    assert_text "Location group was successfully updated"
    click_on "Back"
  end

  test "destroying a Location group" do
    visit location_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location group was successfully destroyed"
  end
end
