class RemindersController < ApplicationController
    before_action :authenticate_user!

    def send_reminder
      ReminderMailer.reminder(current_user.email)
      redirect_to root_path, notice: 'Email sent successfully!'
    end
end
