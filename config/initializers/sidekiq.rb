if ENV.has_key?('REDIS_URL')
  redis_url = ENV.fetch('REDIS_URL')

  Sidekiq.configure_server do |config|
    config.redis = { url: ENV["REDIS_URL"] }
  end

  Sidekiq.configure_client do |config|
    config.redis = { size: ENV.fetch("REDIS_SIZE") { 2 }.to_i, url: ENV["REDIS_URL"]}
  end
end
