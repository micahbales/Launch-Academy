require 'rails_helper'

RSpec.feature "user updates review" , %Q(
  As an authenticated user
  I want to update my review
  So that I can correct any typos
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user
  # [x] When I visit the update page of a review, there is an option to update
  # [x] If I change the content and submit, I am informed that the review has
  #    been updated
  # [x] If I submit an empty review, I get an error

  let!(:user) { FactoryGirl.create(:user) }
  let!(:station) { FactoryGirl.create(:station) }
  let!(:review1) { FactoryGirl.create(:review, station: station) }

  scenario "successfully updates review" do

    visit "/"
    login_user
    click_link(station.name)
    click_link(review1.title)

    fill_in("Review", with: "Let's change this up a little bit.")
    click_button("Update")

    expect(page).to have_content("Review successfully updated!")
    expect(page).to have_content("Let's change this up a little bit.")

    DatabaseCleaner.clean
  end

  scenario "submits empty review" do

    visit "/"
    login_user
    click_link(station.name)
    click_link(review1.title)

    fill_in("Review", with: "")
    click_button("Update")

    expect(page).to have_content("Please provide both a title and a review")
    expect(page).to_not have_content("Let's change this up a little bit.")

    DatabaseCleaner.clean
  end
end
