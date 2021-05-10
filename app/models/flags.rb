class Flags
  class FeatureFlagNotFound < ActiveRecord::RecordNotFound; end

  class << self
    def method_missing(method_name, *args, &block)
      if method_name.to_s =~ /(.*)_active\?$/
        ::FeatureFlag.find_by(key: $1)&.active?
      elsif (ff = ::FeatureFlag.find_by(key: method_name))
        ff
      else
        raise FeatureFlagNotFound.new("Feature Flag with key: #{method_name} was not found")
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      method_name.to_s.ends_with?('_active?') ||
        ::FeatureFlag.all.pluck(:key).include?(method_name.to_s) || super
    end
  end
end
