require "application_system_test_case"

class InterestGroupsTest < ApplicationSystemTestCase
  setup do
    @interest_group = create(:interest_group)
  end

  test "visiting the index" do
    visit interest_groups_url
    assert_selector "h1", text: "Interest Groups"
  end

  test "creating a Interest group" do
    visit interest_groups_url
    click_on "New Interest Group"

    fill_in "Profile", with: @interest_group.profile_id
    fill_in "Title", with: @interest_group.title
    click_on "Create Interest group"

    assert_text "Interest group was successfully created"
    click_on "Back"
  end

  test "updating a Interest group" do
    visit interest_groups_url
    click_on "Edit", match: :first

    fill_in "Profile", with: @interest_group.profile_id
    fill_in "Title", with: @interest_group.title
    click_on "Update Interest group"

    assert_text "Interest group was successfully updated"
    click_on "Back"
  end

  test "destroying a Interest group" do
    visit interest_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interest group was successfully destroyed"
  end
end
