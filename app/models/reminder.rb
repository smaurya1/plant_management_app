class Reminder < ApplicationRecord
    # def self.send_reminders
    #     ReminderMailer.reminder(current_user.email).deliver_now         
    #     notice: 'Email sent successfully!'
    # end

    # def self.send_reminders
    #     puts "send_reminders invoked"
    #     # sending reminders to active users
    #     active_users = User.where("last_active_at > ?", 1.hour.ago)
    
    #     active_users.each do |user|
    #       ReminderMailer.reminder(user.email).deliver_now
    #     end
    # end
    
    # def self.send_reminders
    #     User.find_each do |user|
    #         ReminderMailer.reminder(user.email).deliver_now
    #     end
    # end
end
