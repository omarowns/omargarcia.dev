class ImpressionsController < AdminController
  before_action :set_impression, only: [:show, :edit, :update, :destroy]

  # GET /impressions
  def index
    @impressions = Impression.all.order(created_at: :desc).limit(50)
    @service = ImpressionsAnalyticsService.new(Impression.all)
  end

  # GET /impressions/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_impression
      @impression = Impression.find(params[:id])
    end
end
