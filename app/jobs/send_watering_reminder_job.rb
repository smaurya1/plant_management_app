class SendWateringReminderJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    ReminderMailer.reminder(user.email).deliver_now
    puts "perform executed"
  end
end
