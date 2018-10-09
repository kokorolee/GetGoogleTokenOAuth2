require 'adwords_api'
require 'google/apis/analytics_v3'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/key_utils'
class ApplicationController < ActionController::Base

  before_action :authenticate
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user

  # Returns the API version in use.
  def get_api_version()
    return :v201806
  end

  # Returns currently selected account.
  def selected_account()
    @selected_account ||= session[:selected_account]
    return @selected_account
  end

  # Sets current account to the specified one.
  def selected_account=(new_selected_account)
    @selected_account = new_selected_account
    session[:selected_account] = @selected_account
  end

  # Checks if we have a valid credentials.
  def authenticate()
    token_ads = session[:token_adwords]
    token_ga = session[:token_analytics]
    token_twitter = session[:twitter_id]
    return redirect_to login_path if token_ads.nil? && token_ga.nil? && token_twitter.nil?
    return !token_ads.nil? || !token_ga.nil? || !token_twitter.nil?
  end

  # Returns an API object.
  def get_adwords_api()
    @api ||= create_adwords_api()
    return @api
  end

  # Creates an instance of AdWords API class. Uses a configuration file and
  # Rails config directory.
  def create_adwords_api()
    config_filename = File.join(Rails.root, 'config', 'adwords_api.yml')
    @api = AdwordsApi::Api.new(config_filename)
    token = session[:token_adwords]
    # If we have an OAuth2 token in session we use the credentials from it.
    if token
      credentials = @api.credential_handler()
      credentials.set_credential(:oauth2_token, token)
      credentials.set_credential(:client_customer_id, selected_account)
    end
    return @api
  end

  def create_analytis__request
    ga = Signet::OAuth2::Client.new(
      :authorization_uri => 'https://accounts.google.com/o/oauth2/auth',
      :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
      :scope => 'https://www.googleapis.com/auth/analytics.readonly',
      :client_id => '471993607899-b9jroakasqlafkp0at5l76fdps6cvjr9.apps.googleusercontent.com',
      :client_secret => 'goHZRbOWTAKKfhS_y9MnxrqS',
      :redirect_uri => 'http://localhost:3000/login/callback_ga'
    )
    return ga
  end
end
