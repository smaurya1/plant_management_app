class PlantWateringJob
  include Sidekiq::Job

  def perform(*args)
    # Fetch all users
    User.find_each do |user|
      user.plants.each do |plant|
        # Check if watering time is due for the plant
        if plant.wateringTime <= Time.now
          # Send reminder email
          ReminderMailer.watering_reminder(user.email, plant.id).deliver_now
          puts "Email sent"
        end
      end
    end
  end

end
