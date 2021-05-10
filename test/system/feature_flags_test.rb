require "application_system_test_case"

class FeatureFlagsTest < ApplicationSystemTestCase
  setup do
    @feature_flag = feature_flags(:one)
  end

  test "visiting the index" do
    visit feature_flags_url
    assert_selector "h1", text: "Feature Flags"
  end

  test "creating a Feature flag" do
    visit feature_flags_url
    click_on "New Feature Flag"

    check "Active" if @feature_flag.active
    fill_in "Description", with: @feature_flag.description
    fill_in "Key", with: @feature_flag.key
    click_on "Create Feature flag"

    assert_text "Feature flag was successfully created"
    click_on "Back"
  end

  test "updating a Feature flag" do
    visit feature_flags_url
    click_on "Edit", match: :first

    check "Active" if @feature_flag.active
    fill_in "Description", with: @feature_flag.description
    fill_in "Key", with: @feature_flag.key
    click_on "Update Feature flag"

    assert_text "Feature flag was successfully updated"
    click_on "Back"
  end

  test "destroying a Feature flag" do
    visit feature_flags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Feature flag was successfully destroyed"
  end
end
