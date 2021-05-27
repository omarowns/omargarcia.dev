module ApplicationHelper
  def google_maps_link_path(**args)
    if args.key?(:lat) && args.key?(:long)
      "https://www.google.com/maps/place/#{args[:lat]},#{args[:long]}"
    end
  end
end
