class RemindersController < ApplicationController
    before_action :authenticate_user!

    def send_reminder
      ReminderMailer.reminder(current_user.email).deliver_now
      redirect_to dashboard_path, notice: 'Email sent successfully!'
    end
end
