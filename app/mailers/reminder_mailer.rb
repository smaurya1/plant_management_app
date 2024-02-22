class ReminderMailer < ApplicationMailer
    def reminder(email)
        mail(
          to: email,
          subject: 'LeafLife Care',
          body: 'This is the scheduled email.'
        )
    end
end
