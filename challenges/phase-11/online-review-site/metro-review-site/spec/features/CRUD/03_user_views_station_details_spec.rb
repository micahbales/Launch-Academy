require 'rails_helper'

RSpec.feature "user views station details" , %Q(
  As an anonymous user
  I want to view the details about a station
  So that I can get more information about it
) do

  # Acceptance Criteria:

  # [x] I may be an anonymous or authenticated user
  # [x] When I visit the home page and view the list of stations
  #    I can click on an individual station to see more details
  # [x] Visiting a station's details page, I can see that station's
  #    description and parking info, if provided

  scenario "anonymous user views station details" do

    station = FactoryGirl.create(:station)

    visit "/"
    click_link("Benning Road Station")

    expect(page).to have_content("Benning Road Station")
    expect(page).to have_content("The last stop in Eastern DC")
    expect(page).to have_content("Parking? No")

    DatabaseCleaner.clean
  end

  scenario "authenticated user views station details" do

    station = FactoryGirl.create(:station)
    user = FactoryGirl.create(:user)

    visit "/"
    login_user
    click_link("Benning Road Station")

    expect(page).to have_content("Benning Road Station")
    expect(page).to have_content("The last stop in Eastern DC")
    expect(page).to have_content("Parking? No")

    DatabaseCleaner.clean
  end
end
