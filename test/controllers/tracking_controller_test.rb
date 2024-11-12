require 'test_helper'

class TrackingControllerTest < ActionDispatch::IntegrationTest
  test 'redirects to no_url template when url parameter is missing' do
    get "/"
    assert_response :ok
    assert_template "no_url"    
  end

  test 'accepts a valid url parameter' do
    get "/", params: { url: 'https://example.com' }
    assert_response :redirect
    assert_redirected_to 'https://example.com' 
  end

  test 'adds the protocol if missing' do
    get "/", params: { url: 'example.com' }
    assert_response :redirect
    assert_redirected_to 'http://example.com' 
  end
end