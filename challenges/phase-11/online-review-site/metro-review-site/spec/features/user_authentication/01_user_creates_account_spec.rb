require 'rails_helper'

RSpec.feature "create user account" , %Q(
  As a prospective user
  I want to create an account
  So that I can post items and review them
) do

  # Acceptance Criteria:

  # [x] I must supply my first and last names, and a valid email address.
  # [x] I must provide a password and confirm it
  # [x] If I don't do the above, I get an error
  # [x] If I do the above, my account is registered

  scenario "user successfully creates account" do

    visit "/"
    expect(page).to have_content "Sign In"
    click_link("Sign Up")
    fill_in("First Name", with: "Bobby")
    fill_in("Last Name", with: "Baseball")
    fill_in("Email", with: "bob@baseball.com")
    fill_in("Password", with: "password")
    fill_in("Password Confirmation", with: "password")
    click_button("Sign Up")

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Log Out")
    expect(page).to have_content("Edit Account")

  end

  scenario "user does not enter all required information" do
    visit "/"
    expect(page).to have_content "Sign In"
    click_link("Sign Up")
    fill_in("Email", with: "bob@baseball.com")
    fill_in("Password", with: "password")
    fill_in("Password Confirmation", with: "password")
    click_button("Sign Up")

    expect(page).to_not have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("prohibited this")
    expect(page).to have_content("Sign Up")
    expect(page).to_not have_content("Edit Account")
  end

end
