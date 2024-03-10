class ReminderMailer < ApplicationMailer
    # def reminder(email)
    #     mail(
    #       to: email,
    #       subject: 'LeafLife Care',
    #       body: 'This is the scheduled email.'
    #     )
    # end

    def watering_reminder(email, plant_name)
      @plant_name = plant_name
      mail(
        to: email, 
        subject: "Reminder: Water ",
        body: "Time to water me"
      )
    end
end
