class WorkerNameJob
  include Sidekiq::Job

  def perform(*args)
    puts "perfoms every 2 minutes"
  end

end
