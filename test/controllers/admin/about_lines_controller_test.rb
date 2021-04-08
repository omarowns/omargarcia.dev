require "test_helper"

module Admin
  class AboutLinesControllerTest < ActionDispatch::IntegrationTest
    setup do
      @about_line = create(:about_line)
    end

    test "should get index" do
      get admin_about_lines_url
      assert_response :success
    end

    test "should get new" do
      get new_admin_about_line_url
      assert_response :success
    end

    test "should create about_line" do
      params = {
        about_line: {
          about_id: @about_line.about_id,
          line: @about_line.line,
          position: @about_line.position
        }
      }
      assert_difference('AboutLine.count') do
        post admin_about_lines_url, params: params
      end

      assert_redirected_to admin_about_line_url(AboutLine.last)
    end

    test "should show about_line" do
      get admin_about_line_url(@about_line)
      assert_response :success
    end

    test "should get edit" do
      get edit_admin_about_line_url(@about_line)
      assert_response :success
    end

    test "should update about_line" do
      patch admin_about_line_url(@about_line), params: { about_line: { about_id: @about_line.about_id, line: @about_line.line, position: @about_line.position } }
      assert_redirected_to admin_about_line_url(@about_line)
    end

    test "should destroy about_line" do
      assert_difference('AboutLine.count', -1) do
        delete admin_about_line_url(@about_line)
      end

      assert_redirected_to admin_about_lines_url
    end
  end
end
