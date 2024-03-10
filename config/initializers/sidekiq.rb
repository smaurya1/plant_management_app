Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://redis:6379' }
    config.logger = Rails.logger
end

Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://redis:6379' }
    config.logger = Rails.logger
end

schedule_file = "config/schedule.yml"
if File.exist?(schedule_file) && Sidekiq.server?
   Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
