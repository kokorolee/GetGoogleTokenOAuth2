require 'rest-client'
class HomesController < ApplicationController
  def index
    @token_adwords = Oauth2Token.where(access_token: session[:token_adwords]["access_token"]).first if session[:token_adwords]
    @token_analytics = Oauth2Token.where(access_token: session[:token_analytics]["access_token"]).first if session[:token_analytics].present?


    @allToken = Oauth2Token.all.order(created_at: :DESC)

  end
end
