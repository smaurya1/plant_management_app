class RemindersController < ApplicationController
  before_action :authenticate_user!

  def send_reminder
    SendWateringReminderJob.set(wait_until: 30.seconds.from_now).perform_later(current_user.id)
    redirect_to dashboard_path, notice: 'Reminder email will be sent in 1 minute!'
  end
  
end
