require "test_helper"

class AboutLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @about_line = create(:about_line)
    @about = @about_line.about
  end

  test "should get index" do
    get about_lines_url
    assert_response :success
  end

  test "should get about index" do
    get about_about_lines_url(@about)
    assert_response :success
  end

  test "should get new" do
    get new_about_about_line_url(@about)
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
      post about_about_lines_url(@about), params: params
    end

    assert_redirected_to about_line_url(AboutLine.last)
  end

  test "should show about_line" do
    get about_line_url(@about_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_about_line_url(@about_line)
    assert_response :success
  end

  test "should update about_line" do
    patch about_line_url(@about_line), params: { about_line: { about_id: @about_line.about_id, line: @about_line.line, position: @about_line.position } }
    assert_redirected_to about_line_url(@about_line)
  end

  test "should destroy about_line" do
    assert_difference('AboutLine.count', -1) do
      delete about_line_url(@about_line)
    end

    assert_redirected_to about_about_lines_url(@about)
  end
end
