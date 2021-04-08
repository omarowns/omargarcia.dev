require "application_system_test_case"

module Admin
  class WorkGroupsTest < ApplicationSystemTestCase
    setup do
      @work_group = create(:work_group)
    end

    test "visiting the index" do
      visit admin_work_groups_url
      assert_selector "h1", text: "Work Groups"
    end

    test "creating a Work group" do
      visit admin_work_groups_url
      click_on "New Work Group"

      fill_in "Profile", with: @work_group.profile_id
      fill_in "Title", with: @work_group.title
      click_on "Create Work group"

      assert_text "Work group was successfully created"
      click_on "Back"
    end

    test "updating a Work group" do
      visit admin_work_groups_url
      click_on "Edit", match: :first

      fill_in "Profile", with: @work_group.profile_id
      fill_in "Title", with: @work_group.title
      click_on "Update Work group"

      assert_text "Work group was successfully updated"
      click_on "Back"
    end

    test "destroying a Work group" do
      visit admin_work_groups_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Work group was successfully destroyed"
    end
  end

end
