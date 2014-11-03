# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
env :PATH, ENV['PATH']
# Example:
#
set :output, 'cron_log.log'
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

every 5.minutes do
  command 'cd projects/aphorism/current && rvm use 2.1.2 do bundle exec rake update_rating_aphorism RAILS_ENV=production'
  #rake 'update_rating_aphorism'
end
# Learn more: http://github.com/javan/whenever
