module WorksHelper
  def work_group
    @work_group ||= WorkGroup.find_by(id: params[:work_group_id]) || @work&.work_group
  end
end
