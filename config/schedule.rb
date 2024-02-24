# Use this file to easily define all of your cron jobs.


set :bundle_command, 'bundle exec'
job_type :runner,  "cd :path && :bundle_command rails runner -e :environment ':task' :output"

# Creates a output log for you to view previously run cron jobs
set :output, { error: 'log/cron_error_log.log', standard: 'log/cron_log.log' }

# Sets the environment to run during development mode (Set to production by default)
set :environment, 'development'

every 1.minute do
  runner 'ReminderMailer.remind' 
end
