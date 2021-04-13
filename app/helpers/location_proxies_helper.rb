module LocationProxiesHelper
  def location_group
    @location_group ||= LocationGroup.find_by(id: params[:location_group_id]) || @location_proxy&.locatable
  end
end
