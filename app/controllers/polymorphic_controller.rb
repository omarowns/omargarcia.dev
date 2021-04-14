class PolymorphicController < AdminController
  before_action :check_polymorphic_route

  private
    def check_polymorphic_route
      key = params.keys.find { |key| key.ends_with? '_id' }
      if key.present?
        klass = key.delete_suffix('_id').camelize.safe_constantize
        id = params[key]
        @polymorphic_model = klass.find(id)
      end
    end
end
