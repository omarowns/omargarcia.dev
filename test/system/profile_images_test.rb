require "application_system_test_case"

class ProfileImagesTest < ApplicationSystemTestCase
  setup do
    @profile_image = create(:profile_image)
    @profile = @profile_image.profile
  end

  test "visiting the index" do
    visit profile_profile_images_url(@profile)
    assert_selector "h1", text: "Profile Images"
  end

  test "creating a Profile image" do
    visit profile_profile_images_url(@profile)
    click_on "New Profile Image"

    check "Featured" if @profile_image.featured
    fill_in "Image", with: @profile_image.image_id
    check "Main" if @profile_image.main
    fill_in "Position", with: @profile_image.position
    fill_in "Profile", with: @profile_image.profile_id
    click_on "Create Profile image"

    assert_text "Profile image was successfully created"
    click_on "Back"
  end

  test "updating a Profile image" do
    visit profile_profile_images_url(@profile)
    click_on "Edit", match: :first

    check "Featured" if @profile_image.featured
    fill_in "Image", with: @profile_image.image_id
    check "Main" if @profile_image.main
    fill_in "Position", with: @profile_image.position
    fill_in "Profile", with: @profile_image.profile_id
    click_on "Update Profile image"

    assert_text "Profile image was successfully updated"
    click_on "Back"
  end

  test "destroying a Profile image" do
    visit profile_profile_images_url(@profile)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profile image was successfully destroyed"
  end
end
