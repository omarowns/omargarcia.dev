module InterestsHelper
  def interest_group
    @interest_group ||= InterestGroup.find_by(id: params[:interest_group_id]) || @interest&.interest_group
  end
end
