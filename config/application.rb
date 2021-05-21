require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OmargarciaDev
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Central Time (US & Canada)"
    config.i18n.available_locales = [:en, :"es-MX", :es]
    config.i18n.default_locale = :"es-MX"
    # config.eager_load_paths << Rails.root.join("extras")

    config.hosts << ".omargarcia.dev"
    config.hosts << ".omargarcia.mx"

    RSpotify::authenticate(
      Rails.application.credentials.spotify[:client_id],
      Rails.application.credentials.spotify[:client_secret]
    )

    config.action_mailer.deliver_later_queue_name = 'low' # defaults to "mailers"
    config.active_storage.queues.analysis   = 'low'       # defaults to "active_storage_analysis"
    config.active_storage.queues.purge      = 'low'       # defaults to "active_storage_purge"
    config.active_storage.queues.mirror     = 'low'       # defaults to "active_storage_mirror"
  end
end
