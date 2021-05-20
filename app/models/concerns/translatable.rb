module Translatable
  extend ActiveSupport::Concern

  included do
    @translation_model = "#{self}Translation"

    after_create_commit :create_translations

    has_many :translations, class_name: @translation_model, dependent: :destroy

    has_one :current_translation,
      -> { where locale: I18n.locale },
      class_name: @translation_model

    has_one :default_translation,
      -> { where locale: I18n.default_locale },
      class_name: @translation_model

    def self.translates(*attributes)
      attributes.each do |attribute|
        define_method(attribute) do
          translation_for(attribute)
        end
      end
    end
  end

  def translation_for(attribute)
    if current_translation.nil?
      default_translation.send(attribute)
    else
      current_translation.send(attribute)
    end
  end

  def create_translations
    translations.create(locale: 'es-MX')
    translations.create(locale: 'en')
  end
end
