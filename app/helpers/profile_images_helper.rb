module ProfileImagesHelper
  def profile
    @profile ||= Profile.find_by(id: params[:profile_id]) || @profile_image&.profile
  end
end
