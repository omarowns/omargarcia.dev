class GraphsController < AdminController

  # GET /impressions
  def impressions
    @impressions_data = Impression.all.group('created_at::date').count
  end
end
