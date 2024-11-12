class DashboardController < ApplicationController

  def index
    @total_count = TrackingRequest.all.count
    @unique_visitors = TrackingRequest.select(:uuid).distinct.count
    @urls = TrackingRequest.group(:url).order(count: :desc).count
    puts @urls.inspect
  end
end