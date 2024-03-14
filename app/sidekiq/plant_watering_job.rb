class PlantWateringJob
  include Sidekiq::Job

  def perform(*args)
    # Get the current time in UTC
    current_time_utc = Time.now.utc

    # Calculate the time range
    range_start = (current_time_utc - 30).to_i
    range_end = (current_time_utc + 30).to_i

    # Fetch all users
    User.find_each do |user|
      user.plants.each do |plant|

        # Convert watering time to UTC and adjust to current year, month, and day
        watering_time_utc = plant.wateringTime.in_time_zone("Central Time (US & Canada)").utc
        watering_time_utc = watering_time_utc.change(year: current_time_utc.year, month: current_time_utc.month, day: current_time_utc.day)

        comparison_result = watering_time_utc.to_i >= range_start && watering_time_utc.to_i <= range_end

        # Print out the comparison result
        puts "Comparison result: #{comparison_result}"

        if comparison_result
          # Send reminder email
          ReminderMailer.watering_reminder(user.email, plant).deliver_now
          puts "Email sent for plant: #{plant.name} at #{current_time_utc}. Watering time #{watering_time_utc}"
        else
          puts "Watering time #{watering_time_utc} not within range for plant: #{plant.name} at #{current_time_utc}"
        end
      end
    end
    # puts "Minute has passed #{current_time_utc}."
  end
end