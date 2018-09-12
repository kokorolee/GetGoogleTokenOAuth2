require "application_system_test_case"

class Oauth2ConfigsTest < ApplicationSystemTestCase
  setup do
    @oauth2_config = oauth2_configs(:one)
  end

  test "visiting the index" do
    visit oauth2_configs_url
    assert_selector "h1", text: "Oauth2 Configs"
  end

  test "creating a Oauth2 config" do
    visit oauth2_configs_url
    click_on "New Oauth2 Config"

    fill_in "Clientid", with: @oauth2_config.ClientID
    fill_in "Clientsecret", with: @oauth2_config.ClientSecret
    fill_in "Endpointauthurl", with: @oauth2_config.EndpointAuthURL
    fill_in "Endpointtokenurl", with: @oauth2_config.EndpointTokenURL
    fill_in "Redirecturl", with: @oauth2_config.RedirectURL
    fill_in "Scopes", with: @oauth2_config.Scopes
    click_on "Create Oauth2 config"

    assert_text "Oauth2 config was successfully created"
    click_on "Back"
  end

  test "updating a Oauth2 config" do
    visit oauth2_configs_url
    click_on "Edit", match: :first

    fill_in "Clientid", with: @oauth2_config.ClientID
    fill_in "Clientsecret", with: @oauth2_config.ClientSecret
    fill_in "Endpointauthurl", with: @oauth2_config.EndpointAuthURL
    fill_in "Endpointtokenurl", with: @oauth2_config.EndpointTokenURL
    fill_in "Redirecturl", with: @oauth2_config.RedirectURL
    fill_in "Scopes", with: @oauth2_config.Scopes
    click_on "Update Oauth2 config"

    assert_text "Oauth2 config was successfully updated"
    click_on "Back"
  end

  test "destroying a Oauth2 config" do
    visit oauth2_configs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Oauth2 config was successfully destroyed"
  end
end
