require 'rails_helper'

RSpec.describe "user updates information" , %Q(
  As an authenticated user
  I want to update my information
  So that I can keep my profile up to date
) do

  # Acceptance Criteria:

  # [x] I must be logged in
  # [x] I am able to navigate to the Edit Account page
  # [x] I can update my first name, last name, email, or password
  # [x] I am alerted that my changes have been successful

  scenario "user changes password" do

    user = FactoryGirl.create(:user)

    visit "/"
    login_user
    click_link "Edit Account"
    fill_in("Password", with: "bobby123")
    fill_in("Password Confirmation", with: "bobby123")
    fill_in("Current Password", with: "password")
    click_button("Update")

    expect(page).to have_content("Your account has been updated successfully.")
    expect(page).to have_content("Log Out")
    expect(page).to_not have_content("Sign In")
    expect(page).to_not have_content("prohibited this")
  end

  scenario "user changes email" do

    user = FactoryGirl.create(:user)

    visit "/"
 ### feel like there should be a better way to do this:
    click_link "Sign In"
    fill_in("Email", with: "bob@thebuilder.com")
    fill_in("Password", with: "password")
    click_button "Log In"
 ###
   click_link "Edit Account"
   fill_in("Email", with: "bobby@thebuilder.com")
   fill_in("Current Password", with: "password")
   click_button("Update")

   expect(page).to have_content("Your account has been updated successfully.")
   expect(page).to have_content("Log Out")
   expect(page).to_not have_content("Sign In")
   expect(page).to_not have_content("prohibited this")
  end

  scenario "user changes first_name" do

    user = FactoryGirl.create(:user)

    visit "/"
 ### feel like there should be a better way to do this:
    click_link "Sign In"
    fill_in("Email", with: "bob@thebuilder.com")
    fill_in("Password", with: "password")
    click_button "Log In"
 ###
   click_link "Edit Account"
   fill_in("First Name", with: "Bobby")
   fill_in("Current Password", with: "password")
   click_button("Update")

   expect(page).to have_content("Your account has been updated successfully.")
   expect(page).to have_content("Log Out")
   expect(page).to_not have_content("Sign In")
   expect(page).to_not have_content("prohibited this")
  end
end
