require 'sidekiq/cron'
require 'sidekiq/web'

schedule_file = "config/sidekiq_schedule.yml"

if File.exist?(schedule_file)
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] } # Set the Redis URL from the environment variable
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] } # Set the Redis URL from the environment variable
end
