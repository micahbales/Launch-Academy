require 'spec_helper'

# As a user
# I want to view the details of a meetup
# So that I can learn more about its purpose
# 
# Acceptance Criteria:
#
# On the index page, the name of each meetup should be a link to the meetup's show page.
# On the show page, I should see the name, description, location, and the creator of the meetup.

feature "user views meetup details" do

  let(:meetup) do
    Meetup.create(
    title: 'Free Code Camp DC',
    location: 'Washington, DC',
    description: 'Learning full-stack Javascript together',
    creator: 'Quincy Larson'
    )
  end

  scenario "visits index" do

    meetup
    visit '/'
    click_link 'Free Code Camp DC'
    expect(page).to have_content "Free Code Camp DC"
    expect(page).to have_content "Washington, DC"
    expect(page).to have_content "Learning full-stack Javascript together"
    expect(page).to have_content "Quincy Larson"
  end

end
