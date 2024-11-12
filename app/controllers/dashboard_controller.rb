class DashboardController < ApplicationController

  def index
    @total_count = TrackingRequest.all.count
    @unique_visitors = TrackingRequest.select(:uuid).distinct.count
    @requests_by_date = TrackingRequest.group('tracked_at::date').order('tracked_at::date').count
    @urls = TrackingRequest.group(:url).order(count: :desc).count
  end
end