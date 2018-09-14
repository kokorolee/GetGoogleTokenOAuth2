# == Schema Information
#
# Table name: oauth2_tokens
#
#  id            :bigint(8)        not null, primary key
#  access_token  :string
#  token_type    :string
#  refresh_token :string
#  expiry        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Oauth2Token < ApplicationRecord

  validates :access_token, presence: true

  def self.refresh_token_if_expired
    if self.token_expired?
      response    = RestClient.post "#{ENV['DOMAIN']}oauth2/token", :grant_type => 'refresh_token', :refresh_token => self.refresh_token, :client_id => ENV['APP_ID'], :client_secret => ENV['APP_SECRET']
      refreshhash = JSON.parse(response.body)

      token_will_change!
      expiresat_will_change!

      self.token     = refreshhash['access_token']
      self.expiry = DateTime.now + refreshhash["expires_in"].to_i.seconds

      self.save
      puts 'Saved'
    end
  end

  def self.token_expired?
    expiry = Time.at(self.expiry)
    return true if expiry < Time.now # expired token, so we should quickly return
    token_expires_at = expiry
    save if changed?
    false # token not expired. :D
  end
end
