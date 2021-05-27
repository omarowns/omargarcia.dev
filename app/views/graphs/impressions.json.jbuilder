json.line_chart_data @impressions_chart_data do |date, count|
  json.date date
  json.count count
end

json.donut_chart_data @country_chart_data do |country, count|
  json.label country
  json.value count
end
