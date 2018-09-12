require 'test_helper'

class Oauth2ConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oauth2_config = oauth2_configs(:one)
  end

  test "should get index" do
    get oauth2_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_oauth2_config_url
    assert_response :success
  end

  test "should create oauth2_config" do
    assert_difference('Oauth2Config.count') do
      post oauth2_configs_url, params: { oauth2_config: { ClientID: @oauth2_config.ClientID, ClientSecret: @oauth2_config.ClientSecret, EndpointAuthURL: @oauth2_config.EndpointAuthURL, EndpointTokenURL: @oauth2_config.EndpointTokenURL, RedirectURL: @oauth2_config.RedirectURL, Scopes: @oauth2_config.Scopes } }
    end

    assert_redirected_to oauth2_config_url(Oauth2Config.last)
  end

  test "should show oauth2_config" do
    get oauth2_config_url(@oauth2_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_oauth2_config_url(@oauth2_config)
    assert_response :success
  end

  test "should update oauth2_config" do
    patch oauth2_config_url(@oauth2_config), params: { oauth2_config: { ClientID: @oauth2_config.ClientID, ClientSecret: @oauth2_config.ClientSecret, EndpointAuthURL: @oauth2_config.EndpointAuthURL, EndpointTokenURL: @oauth2_config.EndpointTokenURL, RedirectURL: @oauth2_config.RedirectURL, Scopes: @oauth2_config.Scopes } }
    assert_redirected_to oauth2_config_url(@oauth2_config)
  end

  test "should destroy oauth2_config" do
    assert_difference('Oauth2Config.count', -1) do
      delete oauth2_config_url(@oauth2_config)
    end

    assert_redirected_to oauth2_configs_url
  end
end
