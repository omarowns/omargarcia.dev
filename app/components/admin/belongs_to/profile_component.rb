# frozen_string_literal: true

class Admin::BelongsTo::ProfileComponent < Admin::BelongsToComponent
  def initialize(form:, model:, force: false)
    super(
      form: form,
      model: model,
      attribute: :profile_id,
      select_model: Profile,
      select_attrs: [:type, :id],
      force: force
    )
  end
end
