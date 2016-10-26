require 'rails_helper'

RSpec.feature "user deletes station" , %Q(
  As an authenticated user
  I want to delete a station
  So that no one can review it
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user
  # [x] When I view a station's details, I have an option to edit station info
  # [x] While on the station's edit page, I have an option to delete the station
  # [x] If I select to delete the station, I am alerted it has been deleted

  xscenario "authenticated user deletes station" do

    user = FactoryGirl.create(:user)
    station = FactoryGirl.create(:station)

    visit "/"
    login_user
    click_link("Benning Road Station")
    click_link("Update Station")
    click_link("Delete Station")

    expect(page).to_not have_content("Benning Road")
    expect(page).to have_content("Station deleted from site")

    DatabaseCleaner.clean
  end
end
