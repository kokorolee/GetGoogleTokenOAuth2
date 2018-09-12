require 'adwords_api'
require 'google/apis/analytics_v3'
class LoginsController < ApplicationController

  skip_before_action :authenticate

  GOOGLE_LOGOUT_URL = 'https://www.google.com/accounts/Logout'

  def index
  end

  def prompt_ga
    if session[:token_analytics].blank?
      ga_alias = Google::Apis::AnalyticsV3
      @ga = ga_alias::AnalyticsService.new
      @ga.authorization = Signet::OAuth2::Client.new(
        :authorization_uri => 'https://accounts.google.com/o/oauth2/auth',
        :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
        :scope => 'https://www.googleapis.com/auth/analytics.readonly',
        :client_id => ENV['OAUTH2_CLIENT_ID'],
        :client_secret => ENV['OAUTH2_CLIENT_SECRET'],
        :redirect_uri => login_callback_ga_url
      )
      redirect_to(@ga.authorization.authorization_uri.to_s)
    else
      redirect_to root_path
    end
  end


  def prompt()
    api = get_adwords_api()
    if session[:token_adwords]
      oauth2_ga = Oauth2Token.new(access_token: session[:token_adwords][:access_token], token_type: "adwords", refresh_token: session[:token_adwords][:refresh_token], expiry: session[:token_adwords][:expires_in], issued_at: session[:token_adwords][:issued_at])
      return redirect_to root_path if oauth2_ga.save
      redirect_to login_path
    else
      begin
        token = api.authorize({:oauth2_callback => login_callback_url})
      rescue AdsCommon::Errors::OAuth2VerificationRequired => e
        @login_url = e.oauth_url
      end
    end
  end

  def callback_ga
    client = create_analytis__request()
    begin
      client.code = params['code']
      p 'session ga'
      p session[:token_analytics] = client.fetch_access_token!
      if session[:token_analytics]
        flash.notice = 'Authorized successfully'
        oauth2_ga = Oauth2Token.new(access_token: session[:token_analytics]['access_token'], token_type: "analytics", refresh_token: session[:token_analytics]['refresh_token'], expiry: session[:token_analytics]['expires_in'], issued_at: session[:token_analytics]['issued_at'])
        return redirect_to root_path if oauth2_ga.save
        return  redirect_to login_path
      end
    rescue Signet::AuthorizationError => e
      p e
      flash.alert = 'Authorization failed'
      redirect_to login_path
    end
  end

  def callback()
    api = get_adwords_api()
    begin
      session[:token_adwords] = api.authorize(
          {
            :oauth2_callback => login_callback_url,
            :oauth2_verification_code => params[:code]
          }
      )
      flash.notice = 'Authorized successfully'
      oauth2_ga = Oauth2Token.new(access_token: session[:token_adwords][:access_token], token_type: "adwords", refresh_token: session[:token_adwords][:refresh_token], expiry: session[:token_adwords][:expires_in], issued_at: session[:token_adwords][:issued_at])
      return redirect_to root_path if oauth2_ga.save
      redirect_to login_path
    rescue AdsCommon::Errors::OAuth2VerificationRequired => e
      flash.alert = 'Authorization failed'
      redirect_to login_prompt_path
    end
  end

  def logout()
    [:selected_account, :token_adwords, :token_analytics].each {|key| session.delete(key)}
    redirect_to GOOGLE_LOGOUT_URL
  end
end
