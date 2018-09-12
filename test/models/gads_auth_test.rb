# == Schema Information
#
# Table name: gads_auths
#
#  id             :bigint(8)        not null, primary key
#  CustomerId     :string
#  DeveloperToken :string
#  UserAgent      :string
#  PartialFailure :string
#  ValidateOnly   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class GadsAuthTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
