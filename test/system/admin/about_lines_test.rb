require "application_system_test_case"

class AboutLinesTest < ApplicationSystemTestCase
  setup do
    @about_line = create(:about_line)
  end

  test "visiting the index" do
    visit admin_about_lines_url
    assert_selector "h1", text: "About Lines"
  end

  test "creating a About line" do
    visit admin_about_lines_url
    click_on "New About Line"

    fill_in "About", with: @about_line.about_id
    fill_in "Line", with: @about_line.line
    fill_in "Position", with: @about_line.position
    click_on "Create About line"

    assert_text "About line was successfully created"
    click_on "Back"
  end

  test "updating a About line" do
    visit admin_about_lines_url
    click_on "Edit", match: :first

    fill_in "About", with: @about_line.about_id
    fill_in "Line", with: @about_line.line
    fill_in "Position", with: @about_line.position
    click_on "Update About line"

    assert_text "About line was successfully updated"
    click_on "Back"
  end

  test "destroying a About line" do
    visit admin_about_lines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "About line was successfully destroyed"
  end
end
