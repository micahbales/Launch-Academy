require 'rails_helper'

RSpec.feature "authenticated user downvotes review" , %Q(
  As an authenticated user
  I want to downvote reviews
  So that everyone can beware of bad answers
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user
  # [x] When I visit a station page, I can see reviews of that station
  # [x] Each review has a vote total displayed next to it
  # [x] I can downvote any or all reviews
  # [x] When I downvote the review, the total number of votes is decreased by one
  # [x] I can only downvote once

  let!(:user) { FactoryGirl.create(:user) }
  let!(:station) { FactoryGirl.create(:station) }
  let!(:review1) { FactoryGirl.create(:review, station: station) }

  scenario "authenticated user downvotes review" do

    visit "/"
    login_user
    click_link(station.name)
    click_button("downvote-#{review1.id}")

    expect(page).to have_content('User Rating: -1')
    expect(page).to_not have_content('User Rating: 0')
    expect(page).to_not have_content('User Rating: 1')
    expect(page).to have_content("Thanks for your vote!")

    DatabaseCleaner.clean
  end
end
