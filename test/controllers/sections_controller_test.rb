require "test_helper"

class SectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section = create(:section)
    login
  end

  test "should get index" do
    get profile_sections_url(@section.profile)
    assert_response :success
  end

  test "should get new" do
    get new_profile_section_url(@section.profile)
    assert_response :success
  end

  test "should create section" do
    assert_difference('Section.count') do
      post sections_url, params: { section: { profile_id: @section.profile_id, title: @section.title } }
    end

    assert_redirected_to section_url(Section.last)
  end

  test "should show section" do
    get section_url(@section)
    assert_response :success
  end

  test "should get edit" do
    get edit_section_url(@section)
    assert_response :success
  end

  test "should update section" do
    patch section_url(@section), params: { section: { profile_id: @section.profile_id, title: @section.title } }
    assert_redirected_to section_url(@section)
  end

  test "should destroy section" do
    assert_difference('Section.count', -1) do
      delete section_url(@section)
    end

    assert_redirected_to profile_sections_url(@section.profile)
  end
end
