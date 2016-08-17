class TrackRequestWorker
  include Sidekiq::Worker

  def perform(data)
    Keen.publish(:requests, data)
  end
end