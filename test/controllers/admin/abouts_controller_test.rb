require "test_helper"

module Admin
  class AboutsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @about = create(:about)
    end

    test "should get index" do
      get admin_abouts_url
      assert_response :success
    end

    test "should get new" do
      get new_admin_about_url
      assert_response :success
    end

    test "should create about" do
      params = {
        about: {
          title: @about.title,
          profile_id: @about.profile_id
        }
      }
      assert_difference('About.count') do
        post admin_abouts_url, params: params
      end

      assert_redirected_to admin_about_url(About.last)
    end

    test "should show about" do
      get admin_about_url(@about)
      assert_response :success
    end

    test "should get edit" do
      get edit_admin_about_url(@about)
      assert_response :success
    end

    test "should update about" do
      patch admin_about_url(@about), params: { about: { title: @about.title } }
      assert_redirected_to admin_about_url(@about)
    end

    test "should destroy about" do
      assert_difference('About.count', -1) do
        delete admin_about_url(@about)
      end

      assert_redirected_to admin_abouts_url
    end
  end
end
