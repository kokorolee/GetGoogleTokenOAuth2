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

require 'test_helper'

class Oauth2TokenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
