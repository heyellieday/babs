require 'httparty'

class CacheStationsWorker
  include Sidekiq::Worker

  def perform 
    response = HTTParty.get('http://www.bayareabikeshare.com/stations/json')
    $redis.set("stations", JSON.parse(response)["stationBeanList"].to_json)
  end
end
