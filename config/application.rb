require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Lister
  class Application < Rails::Application

   config.action_mailer.smtp_settings = {
    address:              "smtp.mandrillapp.com",
    port:                 587,
    enable_starttls_auto: true,
    user_name:            ENV["MANDRILL_USERNAME"],
    password:             ENV["MANDRILL_KEY"],
    authentication:       'login',
    domain:               'listlister.herokuapp.com'
  }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # ADA-NOTE: This makes it so rails g model/controller/scaffold
    # doesn't generate a new factories file for each resource
    config.generators do |g|
      g.factory_girl false
    end

  I18n.enforce_available_locales = true
  config.i18n.default_locale = :en
  end
end
