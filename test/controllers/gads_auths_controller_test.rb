require 'test_helper'

class GadsAuthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gads_auth = gads_auths(:one)
  end

  test "should get index" do
    get gads_auths_url
    assert_response :success
  end

  test "should get new" do
    get new_gads_auth_url
    assert_response :success
  end

  test "should create gads_auth" do
    assert_difference('GadsAuth.count') do
      post gads_auths_url, params: { gads_auth: { CustomerId: @gads_auth.CustomerId, DeveloperToken: @gads_auth.DeveloperToken, PartialFailure: @gads_auth.PartialFailure, UserAgent: @gads_auth.UserAgent, ValidateOnly: @gads_auth.ValidateOnly } }
    end

    assert_redirected_to gads_auth_url(GadsAuth.last)
  end

  test "should show gads_auth" do
    get gads_auth_url(@gads_auth)
    assert_response :success
  end

  test "should get edit" do
    get edit_gads_auth_url(@gads_auth)
    assert_response :success
  end

  test "should update gads_auth" do
    patch gads_auth_url(@gads_auth), params: { gads_auth: { CustomerId: @gads_auth.CustomerId, DeveloperToken: @gads_auth.DeveloperToken, PartialFailure: @gads_auth.PartialFailure, UserAgent: @gads_auth.UserAgent, ValidateOnly: @gads_auth.ValidateOnly } }
    assert_redirected_to gads_auth_url(@gads_auth)
  end

  test "should destroy gads_auth" do
    assert_difference('GadsAuth.count', -1) do
      delete gads_auth_url(@gads_auth)
    end

    assert_redirected_to gads_auths_url
  end
end
