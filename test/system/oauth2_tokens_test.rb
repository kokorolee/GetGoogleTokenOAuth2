require "application_system_test_case"

class Oauth2TokensTest < ApplicationSystemTestCase
  setup do
    @oauth2_token = oauth2_tokens(:one)
  end

  test "visiting the index" do
    visit oauth2_tokens_url
    assert_selector "h1", text: "Oauth2 Tokens"
  end

  test "creating a Oauth2 token" do
    visit oauth2_tokens_url
    click_on "New Oauth2 Token"

    fill_in "Access Token", with: @oauth2_token.access_token
    fill_in "Expiry", with: @oauth2_token.expiry
    fill_in "Refresh Token", with: @oauth2_token.refresh_token
    fill_in "Token Type", with: @oauth2_token.token_type
    click_on "Create Oauth2 token"

    assert_text "Oauth2 token was successfully created"
    click_on "Back"
  end

  test "updating a Oauth2 token" do
    visit oauth2_tokens_url
    click_on "Edit", match: :first

    fill_in "Access Token", with: @oauth2_token.access_token
    fill_in "Expiry", with: @oauth2_token.expiry
    fill_in "Refresh Token", with: @oauth2_token.refresh_token
    fill_in "Token Type", with: @oauth2_token.token_type
    click_on "Update Oauth2 token"

    assert_text "Oauth2 token was successfully updated"
    click_on "Back"
  end

  test "destroying a Oauth2 token" do
    visit oauth2_tokens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Oauth2 token was successfully destroyed"
  end
end
