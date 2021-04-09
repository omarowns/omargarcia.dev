require "application_system_test_case"

class InterestsTest < ApplicationSystemTestCase
  setup do
    @interest = create(:interest)
    @interest_group = @interest.interest_group
  end

  test "visiting the index" do
    visit interest_group_interests_url(@interest_group)
    assert_selector "h1", text: "Interests"
  end

  test "creating a Interest" do
    visit interest_group_interests_url(@interest_group)
    click_on "New Interest"

    select @interest.interest_group.title, from: "Interest group"
    fill_in "Profile position", with: @interest.profile_position
    fill_in "Value", with: @interest.value
    click_on "Create Interest"

    assert_text "Interest was successfully created"
    click_on "Back"
  end

  test "updating a Interest" do
    visit interest_group_interests_url(@interest_group)
    click_on "Edit", match: :first

    fill_in "Profile position", with: @interest.profile_position
    fill_in "Value", with: @interest.value
    click_on "Update Interest"

    assert_text "Interest was successfully updated"
    click_on "Back"
  end

  test "destroying a Interest" do
    visit interest_group_interests_url(@interest_group)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interest was successfully destroyed"
  end
end
