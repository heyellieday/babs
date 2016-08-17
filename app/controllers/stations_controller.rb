class StationsController < ApplicationController
  def index
    render json: $redis.get("stations")
  end
end
