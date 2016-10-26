require 'rails_helper'

RSpec.feature "user updates station info" , %Q(
  As an authenticated user
  I want to update a station's information
  So that I can correct errors or provide new information
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user
  # [x] When I view a station's details, I have an option to edit station info
  # [x] I may edit a station's name, line, or state (but these details cannot
  #    be blank)
  # [x] I may also optionally provide (or remove) a station description
  #    and parking info
  # [x] If I enter updated information and submit, I am redirected to the
  #    station's details page and alerted that the station has been updated
  # [x] If I enter incomplete information, I am informed that the station has
  #     not been updated, and I am redirected to the edit page

  scenario "authenticated user updates station" do

    user = FactoryGirl.create(:user)
    station = FactoryGirl.create(:station)

    visit "/"
    login_user
    click_link("Benning Road")
    click_link("Update Station")
    fill_in("Description", with: "The administration has threatened to close this station, among others")
    uncheck("Parking?")
    click_button("Update Station")

    expect(page).to have_content("The administration has threatened to close this station, among others")
    expect(page).to have_content("Your station has been successfully updated!")
    expect(page).to have_content("Parking? No")

    DatabaseCleaner.clean
  end

  scenario "authenticated user enters incomplete information" do

    user = FactoryGirl.create(:user)
    station = FactoryGirl.create(:station)

    visit "/"
    login_user
    click_link("Benning Road")
    click_link("Update Station")
    fill_in("Name", with: "")
    fill_in("Description", with: "The administration has threatened to close this station, among others")
    uncheck("Parking?")
    click_button("Update Station")

    expect(page).to have_content("Your station could not be updated. Please provide all required information.")
    expect(page).to_not have_content("Your station has been successfully updated!")
    expect(page).to have_content("Update Station")

    DatabaseCleaner.clean
  end

  scenario "anonymous user cannot update station" do

    station = FactoryGirl.create(:station)

    visit "/"
    click_link("Benning Road")

    expect(page).to have_content("Benning Road Station")
    expect(page).to_not have_content("Update This Station")

    DatabaseCleaner.clean
  end
end
