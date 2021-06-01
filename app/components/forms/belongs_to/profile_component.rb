# frozen_string_literal: true

class Forms::BelongsTo::ProfileComponent < Forms::BelongsToComponent
  def initialize(form:, model:, force: false, params: {})
    super(
      form: form,
      model: model,
      attribute: :profile_id,
      select_model: Profile,
      select_attrs: [:type, :id],
      force: force,
      params: params
    )
  end
end
