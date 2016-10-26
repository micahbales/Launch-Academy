require 'rails_helper'

RSpec.feature "user signs in" , %Q(
  As an unauthenticated user
  I want to sign in
  So that I can post items and review them
) do

  # Acceptance Criteria:

  # [x] I must enter a valid email address and password
  # [x] If I do, then I am logged in & see a confirmation message
  # [x] If I do not, then I am not logged in and see an error message

  scenario "user successfully signs in" do

    user = FactoryGirl.create(:user)

    visit "/"
    login_user
    expect(page).to have_content("Log Out")
    expect(page).to have_content("Edit Account")
    expect(page).to have_content("You have signed in successfully.")
    expect(page).to_not have_content("Sign In")
  end

  scenario "user enters invalid information" do

    visit "/"
    login_user

    expect(page).to_not have_content("Log Out")
    expect(page).to_not have_content("Edit Account")
    expect(page).to_not have_content("You have signed in successfully.")
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Invalid Email or password.")
  end
end
