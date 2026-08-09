require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

module Work
  class Application < Rails::Application
    config.load_defaults 7.2
    config.autoload_lib(ignore: %w[assets tasks])
    config.generators.system_tests = nil

    # Dev fallback for secret_key_base so the app boots with no .env
    config.secret_key_base = ENV.fetch("SECRET_KEY_BASE",
      "cenius-dev-3f7a91e2b5c84d6a01f8e9d2c3b7a514e6f8091c2d3e4f5a6b7c8d9e0f1a2b")

    # Session store — cookie-based, non-secure for plain HTTP preview
    config.session_store :cookie_store,
      key: "_work_session",
      same_site: :lax,
      secure: false
  end
end
