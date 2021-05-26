class ImpressionsAnalyticsService
  attr_accessor :impressions

  def initialize(impressions)
    @impressions = impressions.where.not(controller_name: nil)
                              .or(impressions.where.not(action_name: nil))

    @traffic_cache = Hash.new do |hash, key|
      hash[key] = @impressions.where(created_at: key.days.ago.beginning_of_day..DateTime.now.end_of_day).count
    end
  end

  def total_views
    @_total_views ||= @impressions.count
  end

  def total_view_past_days(days = 1)
    @traffic_cache[days]
  end

  def total_views_one_week_ago
    @_total_views_one_week_ago ||= @impressions.where(created_at: 1.weeks.ago.beginning_of_day..DateTime.now.end_of_day).count
  end

  def total_views_two_week_ago
    @_total_views_two_week_ago ||= @impressions.where(created_at: 2.weeks.ago.beginning_of_day..1.week.ago.end_of_day).count
  end

  def trend
    total_views_one_week_ago <=> total_views_two_week_ago
  end

  def growth
    total_views_one_week_ago.to_f / (total_views_two_week_ago.zero? ? 1 : total_views_two_week_ago)
  end

  def growth_percentage
    growth * 100
  end
end
