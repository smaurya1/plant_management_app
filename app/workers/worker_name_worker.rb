class WorkerNameWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "perfoms every 2 minutes"
  end

end
