# config/initializers/sidekiq.rb

Sidekiq.configure_server do |config|
    redis_url = Rails.env.production? ? 'redis://aqua-voyage-redis.fly.dev:6379/0' : 'redis://localhost:6379/0'
    config.redis = { url: redis_url }
  end
  
  Sidekiq.configure_client do |config|
    redis_url = Rails.env.production? ? 'redis://aqua-voyage-redis.fly.dev:6379/0' : 'redis://localhost:6379/0'
    config.redis = { url: redis_url }
  end