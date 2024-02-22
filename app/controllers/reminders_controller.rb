class RemindersController < ApplicationController
    before_action :authenticate_user!

    def send_reminder
    #   ReminderMailer.reminder(params[:email]).deliver_now
      ReminderMailer.reminder(current_user.email).deliver_now
      redirect_to root_path, notice: 'Email sent successfully!'
    end
end
