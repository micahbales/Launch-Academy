require 'rails_helper'

RSpec.feature "admin deletes station" , %Q(
  As an admin user,
  I want to delete a station,
  So that only relevant stations are listed
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user with admin privileges
  # [x] When I navigate to the station update page, I have an option to
  #    delete the station
  # [x] Non-admins cannot delete stations

  let!(:user1) { FactoryGirl.create(:user, email: "micahbales@gmail.com", password: "password", admin: true) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:station1) { FactoryGirl.create(:station) }
  let!(:station2) { FactoryGirl.create(:station, name: "Anacostia") }

  scenario "admin deletes station" do

    visit "/"
    login_admin
    click_link("station-#{station1.id}")
    click_link("Update Station")
    click_link("Delete Station")

    expect(page).to have_content("Anacostia Station")
    expect(page).to_not have_content("Benning Road Station")
    expect(page).to have_content("Station deleted from site")
    DatabaseCleaner.clean
  end

  scenario "non-admin user cannot delete station" do

    visit "/"
    login_user
    click_link("station-#{station1.id}")
    click_link("Update Station")

    expect(page).to_not have_content("Delete Station")

    DatabaseCleaner.clean
  end
end
