require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
  setup do
    @profile = create(:profile)
    login
  end

  test "visiting the index" do
    visit profiles_url
    assert_selector "h1", text: "Profiles"
  end

  test "creating a Profile" do
    visit profiles_url
    click_on "New Profile"

    fill_in "Animoji", with: @profile.animoji
    fill_in "Name", with: @profile.name
    fill_in "Title", with: @profile.title
    fill_in "Type", with: @profile.type
    click_on "Create Profile"

    assert_text "Profile was successfully created"
    click_on "Back"
  end

  test "updating a Profile" do
    visit profiles_url
    click_on "Edit", match: :first

    fill_in "Animoji", with: @profile.animoji
    fill_in "Name", with: @profile.name
    fill_in "Title", with: @profile.title
    fill_in "Type", with: @profile.type
    click_on "Update Profile"

    assert_text "Profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Profile" do
    visit profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profile was successfully destroyed"
  end
end
