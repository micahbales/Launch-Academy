require 'rails_helper'

RSpec.feature "authenticated user neutralizes vote on review" , %Q(
  As an authenticated user
  I want to undo my vote
  So that I can correct my mistakes
) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user
  # [x] When I click the vote button of a review I have already upvoted
  #    the total number of votes is reduced by one

  let!(:user) { FactoryGirl.create(:user) }
  let!(:station) { FactoryGirl.create(:station) }
  let!(:review1) { FactoryGirl.create(:review, station: station) }

  scenario "authenticated user upvotes review" do

    visit "/"
    login_user
    click_link(station.name)
    click_button("upvote-#{review1.id}")
    click_button("downvote-#{review1.id}")

    expect(page).to have_content('User Rating: 0')
    expect(page).to_not have_content('User Rating: -1')
    expect(page).to_not have_content('User Rating: 1')
    expect(page).to have_content("Your vote has been updated!")

    DatabaseCleaner.clean
  end
end
