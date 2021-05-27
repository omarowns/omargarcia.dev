class AnalyticsController < AdminController
  def index
    @service = ImpressionsAnalyticsService.new(Impression.all)
  end
end
