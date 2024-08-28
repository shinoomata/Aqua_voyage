# config/initializers/sidekiq.rb

Sidekiq.configure_server do |config|
    redis_url = ENV['REDIS_URL'] || 'redis://localhost:6379/0'
    config.redis = { url: redis_url }
  end
  
  Sidekiq.configure_client do |config|
    redis_url = ENV['REDIS_URL'] || 'redis://localhost:6379/0'
    config.redis = { url: redis_url }
  end
  