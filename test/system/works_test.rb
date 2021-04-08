require "application_system_test_case"

class WorksTest < ApplicationSystemTestCase
  setup do
    @work = create(:work)
    @work_group = @work.work_group
  end

  test "visiting the index" do
    visit work_group_works_url(@work_group)
    assert_selector "h1", text: "Works"
  end

  test "creating a Work" do
    visit work_group_works_url(@work_group)
    click_on "New Work"

    fill_in "Additional", with: @work.additional
    fill_in "Duration", with: @work.duration
    fill_in "Image pack tag", with: @work.image_pack_tag
    fill_in "Link", with: @work.link
    fill_in "Title", with: @work.title
    fill_in "Work group", with: @work_group.id
    click_on "Create Work"

    assert_text "Work was successfully created"
    click_on "Back"
  end

  test "updating a Work" do
    visit work_group_works_url(@work_group)
    click_on "Edit", match: :first

    fill_in "Additional", with: @work.additional
    fill_in "Duration", with: @work.duration
    fill_in "Image pack tag", with: @work.image_pack_tag
    fill_in "Link", with: @work.link
    fill_in "Title", with: @work.title
    fill_in "Work group", with: @work.work_group_id
    click_on "Update Work"

    assert_text "Work was successfully updated"
    click_on "Back"
  end

  test "destroying a Work" do
    visit work_group_works_url(@work_group)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work was successfully destroyed"
  end
end
