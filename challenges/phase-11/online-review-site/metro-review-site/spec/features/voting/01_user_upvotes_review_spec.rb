require 'rails_helper'

RSpec.feature "user votes on review" , %Q(
  As an authenticated user
  I want to vote on reviews
  So that everyone will know which reviews are the best
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user
  # [x] When I visit a station page, I can see reviews of that station
  # [x] Each review has a vote total displayed next to it
  # [x] I can upvote any or all reviews
  # [x] When I upvote the review, the total number of votes is increased by one
  # [x] I can only upvote once

  let!(:user) { FactoryGirl.create(:user) }
  let!(:station) { FactoryGirl.create(:station) }
  let!(:review1) { FactoryGirl.create(:review, station: station) }

  scenario "authenticated user upvotes review" do

    visit "/"
    login_user
    click_link(station.name)
    click_button("upvote-#{review1.id}")

    expect(page).to have_content('User Rating: 1')
    expect(page).to have_content("Thanks for your vote!")

    DatabaseCleaner.clean
  end

  scenario "unauthenticated user tries to upvote review" do

    visit '/'
    click_link("#{station.name} Station")


    expect(page).to_not have_content('+')
    expect(page).to have_content("Sign in to vote!")

    DatabaseCleaner.clean
  end
end
