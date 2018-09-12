require "application_system_test_case"

class GadsAuthsTest < ApplicationSystemTestCase
  setup do
    @gads_auth = gads_auths(:one)
  end

  test "visiting the index" do
    visit gads_auths_url
    assert_selector "h1", text: "Gads Auths"
  end

  test "creating a Gads auth" do
    visit gads_auths_url
    click_on "New Gads Auth"

    fill_in "Customerid", with: @gads_auth.CustomerId
    fill_in "Developertoken", with: @gads_auth.DeveloperToken
    fill_in "Partialfailure", with: @gads_auth.PartialFailure
    fill_in "Useragent", with: @gads_auth.UserAgent
    fill_in "Validateonly", with: @gads_auth.ValidateOnly
    click_on "Create Gads auth"

    assert_text "Gads auth was successfully created"
    click_on "Back"
  end

  test "updating a Gads auth" do
    visit gads_auths_url
    click_on "Edit", match: :first

    fill_in "Customerid", with: @gads_auth.CustomerId
    fill_in "Developertoken", with: @gads_auth.DeveloperToken
    fill_in "Partialfailure", with: @gads_auth.PartialFailure
    fill_in "Useragent", with: @gads_auth.UserAgent
    fill_in "Validateonly", with: @gads_auth.ValidateOnly
    click_on "Update Gads auth"

    assert_text "Gads auth was successfully updated"
    click_on "Back"
  end

  test "destroying a Gads auth" do
    visit gads_auths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gads auth was successfully destroyed"
  end
end
