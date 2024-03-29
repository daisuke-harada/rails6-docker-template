require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    # defaultをajaxリクエストとして送信されるようにする
    # Rails6.1からデフォルトがHTMLリクエストに戻されているため、Ajaxリクエストにする
    # REF:https://techracho.bpsinc.jp/hachi8833/2021_01_22/103256
    config.action_view.form_with_generates_remote_forms = true

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
