class Tracking::TrackJob
  include Sidekiq::Job

  IP_API_URL = "http://ip-api.com/json".freeze

  def perform(datetime, ip, os, device, url, referrer, language, uuid)
    Rails.logger.info "JOB RUNNING: #{datetime} : #{ip} : #{url} : #{uuid}"

    # pinpoint location from ip
    location = nil
    country = nil
    response = HTTParty.get("#{IP_API_URL}/#{ip}", format: :json)
    if response.code == 200 && response['status'] == 'success'
      location = "#{response['city']}, #{response['regionName']}"
      country = response['country']
    else
      Rails.logger.warn "A location could not be found for IP #{ip}"
    end

    TrackingRequest.create!(
      uuid: uuid,
      tracked_at: DateTime.parse(datetime),
      ip: ip,
      country: country,
      location: location,
      os: os,
      device: device,
      url: url,
      referrer: referrer,
      language: language
    )

  end
end
