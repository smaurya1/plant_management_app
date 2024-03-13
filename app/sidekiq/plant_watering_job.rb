class PlantWateringJob
  include Sidekiq::Job

  def perform(*args)
    # Get the current time
    current_time = Time.now

    # Calculate the time range
    range_start = (current_time - 30).to_i
    range_end = (current_time + 30).to_i

    # Fetch all users
    User.find_each do |user|
      user.plants.each do |plant|
        # Adjust watering time to current year, month, and day while keeping the time
        watering_time = plant.wateringTime.change(year: current_time.year, month: current_time.month, day: current_time.day)

        # Adjust the time zone to UTC
        watering_time_utc = watering_time.in_time_zone('UTC') + 3600

        comparison_result = watering_time_utc.to_i >= range_start && watering_time_utc.to_i <= range_end

        # Print out the comparison result
        puts "Comparison result: #{comparison_result}"

        if comparison_result
          # Send reminder email
          ReminderMailer.watering_reminder(user.email, plant.name).deliver_now
          puts "Email sent for plant: #{plant.name} at #{current_time}. Watering time #{watering_time}"
        else
          puts "Watering time #{watering_time_utc} not within range for plant: #{plant.name} at #{current_time}"
        end
      end
    end
    # puts "Minute has passed #{current_time}."
  end
end
