class TrackingService < ApplicationService
  def initialize ip:, user_agent:, url:, referrer:, language:, uuid:
    @ip = ip
    @user_agent = user_agent
    @url = url
    @referrer = referrer
    @language = language
    @uuid = uuid
    @datetime = DateTime.now
  end

  def call
    client = DeviceDetector.new(@user_agent)
    device = client.device_name
    os = "#{client.os_name} #{client.os_full_version}"

    Tracking::TrackJob.perform_async(@datetime.to_s, @ip, os, device, @url, @referrer, @language, @uuid)
  end
end