require "test_helper"

class WorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work = create(:work)
    @work_group = @work.work_group
  end

  test "should get index" do
    get works_url
    assert_response :success
  end

  test "should get work group's index" do
    get work_group_works_url(@work_group)
    assert_response :success
  end

  test "should get new" do
    get new_work_group_work_path(@work_group)
    assert_response :success
  end

  test "should create work" do
    assert_difference('Work.count') do
      post work_group_works_url(@work_group), params: { work: { additional: @work.additional, duration: @work.duration, image_pack_tag: @work.image_pack_tag, link: @work.link, title: @work.title, work_group_id: @work.work_group_id } }
    end

    assert_redirected_to work_url(Work.last)
  end

  test "should show work" do
    get work_url(@work)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_url(@work)
    assert_response :success
  end

  test "should update work" do
    patch work_url(@work), params: { work: { additional: @work.additional, duration: @work.duration, image_pack_tag: @work.image_pack_tag, link: @work.link, title: @work.title, work_group_id: @work.work_group_id } }
    assert_redirected_to work_url(@work)
  end

  test "should destroy work" do
    assert_difference('Work.count', -1) do
      delete work_url(@work)
    end

    assert_redirected_to work_group_works_url(@work_group)
  end
end
