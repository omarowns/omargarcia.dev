class GraphsController < AdminController

  # GET /impressions
  def impressions
    @impressions_chart_data = Impression.all.group('created_at::date').count
    @country_chart_data = Visit.all.group('country').order('count_all desc').count.reject { |k,v| k.nil? }
  end
end
