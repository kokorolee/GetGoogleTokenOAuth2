# == Schema Information
#
# Table name: oauth2_configs
#
#  id               :bigint(8)        not null, primary key
#  ClientID         :string
#  ClientSecret     :string
#  EndpointAuthURL  :string
#  EndpointTokenURL :string
#  RedirectURL      :string
#  Scopes           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class Oauth2ConfigTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
