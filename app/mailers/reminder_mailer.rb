class ReminderMailer < ApplicationMailer
    # def reminder(email)
    #     mail(
    #       to: email,
    #       subject: 'LeafLife Care',
    #       body: 'This is the scheduled email.'
    #     )
    # end

    def watering_reminder
      @email = email
      @subject = subject
      @body = body
      mail(
        to: @email, 
        subject: @subject,
        body: @body
      )
    end
end
