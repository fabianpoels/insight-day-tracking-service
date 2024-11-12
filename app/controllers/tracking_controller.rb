class TrackingController < ApplicationController
  before_action :get_session

  def track
    url = params[:url]

    # render the fallback page when no url is present
    if url.blank?
      render "track"
      return
    end

    TrackingService.call(
      ip: request.remote_ip,
      user_agent: request.headers['User-Agent'],
      url: params[:q],
      referrer: request.referrer,
      language: request.headers['Accept-Language'],
      uuid: session[:uuid]
    )

    # redirect to the provided url
  end

  private

  def get_session
    session[:uuid] = SecureRandom.uuid if session[:uuid].blank?
  end

end
