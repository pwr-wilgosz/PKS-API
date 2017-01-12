require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Source
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'

        resource '/cors',
          headers: :any,
          methods: :any,
          expose: ['Access-Control-Allow-Credentials', 'Access-Control-Allow-Methods', 'Access-Control-Allow-Origin', 'Access-Control-Expose-Headers', 'Access-Control-Max-Age', 'access-token', 'Cache-Control', 'client', 'Content-Type', 'ETag', 'expiry', 'token-type', 'Transfer-Encoding', 'uid', 'Vary', 'X-Content-Type-Options', 'X-Frame-Options', 'X-Request-Id', 'X-Runtime', 'X-XSS-Protection'],
          credentials: true

        resource '*',
          headers: :any,
          methods: :any,
          expose: ['Access-Control-Allow-Credentials', 'Access-Control-Allow-Methods', 'Access-Control-Allow-Origin', 'Access-Control-Expose-Headers', 'Access-Control-Max-Age', 'access-token', 'Cache-Control', 'client', 'Content-Type', 'ETag', 'expiry', 'token-type', 'Transfer-Encoding', 'uid', 'Vary', 'X-Content-Type-Options', 'X-Frame-Options', 'X-Request-Id', 'X-Runtime', 'X-XSS-Protection'],
          credentials: true
      end
    end
  end
end

