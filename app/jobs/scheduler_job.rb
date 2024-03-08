# class SchedulerJob < ApplicationJob
#   queue_as :default

#   def perform(user_id)
#     user = User.find(user_id)
#     ReminderMailer.reminder(user.email).deliver_now
#     puts "perform executed"
#   end

#   def perform(user_id, reminder_id)
#     user = User.find_by_id(user_id)
#     reminder = Reminder.find_by_id(reminder_id)
    
#     return unless user && reminder # Exit early if user or reminder doesn't exist

#     ReminderMailer.reminder_email(user.email, reminder).deliver_later
#     Rails.logger.info("Reminder email for '#{reminder.title}' sent to #{user.email}")
#   rescue StandardError => e
#     Rails.logger.error("Error sending reminder email for '#{reminder.title}': #{e.message}")
#   end
  
# end
