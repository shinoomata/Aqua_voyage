require_relative "boot"

require "rails/all"
Dotenv::Railtie.load if defined?(Dotenv)
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AppName
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.hosts << "aqua-voyage.com"
    config.secret_key_base = ENV['SECRET_KEY_BASE']
    # Active Job のキューアダプタとして Sidekiq を使用
    # config.active_job.queue_adapter = :sidekiq
    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: true,
                       request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"  # FactoryBotを使う場合
      
      # Minitestの生成を無効化する
      g.test_framework nil
    end
  end
end