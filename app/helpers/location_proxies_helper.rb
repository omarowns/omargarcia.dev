module LocationProxiesHelper
  def location_group
    @location_group ||= LocationGroup.find_by(id: params[:location_group_id]) || @location_proxy&.locatable
  end

  def polymorphic_keys
    %w(image_id location_group_id work_id).freeze
  end
end
