require 'rails_helper'

RSpec.describe "user deletes account" , %Q(
  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app
) do

  # Acceptance Criteria:

  # [x] I must be logged in
  # [x] I am able to navigate to the Edit Account page
  # [x] When I choose to delete my account, I am logged out and my account is removed

  scenario "user successfully deletes account" do

    user = FactoryGirl.create(:user)

    visit "/"
    login_user
    click_link "Edit Account"
    click_button("Cancel My Account")

    expect(page).to_not have_content("Your account has been updated successfully.")
    expect(page).to_not have_content("Log Out")
    expect(page).to_not have_content("prohibited this")
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Your account has been successfully cancelled.")

  end
end
