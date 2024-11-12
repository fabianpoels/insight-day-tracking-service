class TrackingController < ApplicationController
  before_action :get_session

  def track
    url = params[:url]

    # render the fallback page when no url is present
    if url.blank?
      render "no_url"
      return
    end

    # add the protocol if it is missing from the url
    url = url.match(/https?:\/\//) ? url : "http://#{url}"

    TrackingService.call(
      ip: request.remote_ip,
      user_agent: request.headers['User-Agent'],
      url: url,
      referrer: request.referrer,
      language: request.headers['Accept-Language'],
      uuid: session[:uuid]
    )

    redirect_to url, allow_other_host: true
  end

  private

  def get_session
    session[:uuid] = SecureRandom.uuid if session[:uuid].blank?
  end

end
