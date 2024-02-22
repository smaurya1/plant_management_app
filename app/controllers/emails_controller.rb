class EmailsController < ApplicationController
    def send_reminder
        ReminderMailer.reminder.deliver_now
        redirect_to root_path, notice: 'Email sent successfully!'
    end
end
