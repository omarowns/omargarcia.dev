require "test_helper"

class ProfileImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile_image = create(:profile_image)
    @profile = @profile_image.profile
    @new_image = create(:image)
  end

  test "should get index" do
    get profile_images_url
    assert_response :success
  end

  test "should get profile's index" do
    get profile_profile_images_url(@profile)
    assert_response :success
  end

  test "should get new" do
    get new_profile_profile_image_url(@profile)
    assert_response :success
  end

  test "should create profile_image" do
    params = {
      profile_image: {
        featured: @profile_image.featured,
        image_id: @new_image.id,
        main: @profile_image.main,
        position: @profile_image.position + 1,
        profile_id: @profile_image.profile_id
      }
    }

    assert_difference('ProfileImage.count') do
      post profile_profile_images_url(@profile), params: params
    end

    assert_redirected_to profile_image_url(ProfileImage.last)
  end

  test "should show profile_image" do
    get profile_image_url(@profile_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_image_url(@profile_image)
    assert_response :success
  end

  test "should update profile_image" do
    patch profile_image_url(@profile_image), params: { profile_image: { featured: @profile_image.featured, image_id: @profile_image.image_id, main: @profile_image.main, position: @profile_image.position, profile_id: @profile_image.profile_id } }
    assert_redirected_to profile_image_url(@profile_image)
  end

  test "should destroy profile_image" do
    assert_difference('ProfileImage.count', -1) do
      delete profile_image_url(@profile_image)
    end

    assert_redirected_to profile_profile_images_url(@profile)
  end
end
