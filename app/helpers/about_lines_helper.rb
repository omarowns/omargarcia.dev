module AboutLinesHelper
  def about
    @about ||= About.find_by(id: params[:about_id]) || @about_line&.about
  end
end
