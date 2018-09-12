require 'test_helper'

class Oauth2TokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oauth2_token = oauth2_tokens(:one)
  end

  test "should get index" do
    get oauth2_tokens_url
    assert_response :success
  end

  test "should get new" do
    get new_oauth2_token_url
    assert_response :success
  end

  test "should create oauth2_token" do
    assert_difference('Oauth2Token.count') do
      post oauth2_tokens_url, params: { oauth2_token: { access_token: @oauth2_token.access_token, expiry: @oauth2_token.expiry, refresh_token: @oauth2_token.refresh_token, token_type: @oauth2_token.token_type } }
    end

    assert_redirected_to oauth2_token_url(Oauth2Token.last)
  end

  test "should show oauth2_token" do
    get oauth2_token_url(@oauth2_token)
    assert_response :success
  end

  test "should get edit" do
    get edit_oauth2_token_url(@oauth2_token)
    assert_response :success
  end

  test "should update oauth2_token" do
    patch oauth2_token_url(@oauth2_token), params: { oauth2_token: { access_token: @oauth2_token.access_token, expiry: @oauth2_token.expiry, refresh_token: @oauth2_token.refresh_token, token_type: @oauth2_token.token_type } }
    assert_redirected_to oauth2_token_url(@oauth2_token)
  end

  test "should destroy oauth2_token" do
    assert_difference('Oauth2Token.count', -1) do
      delete oauth2_token_url(@oauth2_token)
    end

    assert_redirected_to oauth2_tokens_url
  end
end
