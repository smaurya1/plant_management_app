class ReminderMailer < ApplicationMailer
    # def reminder(email)
    #     mail(
    #       to: email,
    #       subject: 'LeafLife Care',
    #       body: 'This is the scheduled email.'
    #     )
    # end

    def watering_reminder(email, plant_name)
      @plant = plant_name
      emailContent = ChatGPTService.email(@plant.user, @plant.name, @plant.personality)
      mail(
        to: email, 
        subject: "Reminder: Water ",
        body: emailContent
      )
    end
end
