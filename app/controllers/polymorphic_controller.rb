class PolymorphicController < AdminController
  before_action :check_polymorphic_route

  private
    def check_polymorphic_route
      key_intersection = helpers.polymorphic_keys & params.keys
      if key_intersection.any?
        klass = key_intersection.first.delete_suffix('_id').camelize.safe_constantize
        id = params[key_intersection.first]
        @polymorphic_model = klass.find(id)
      end
    end
end
