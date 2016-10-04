require 'spec_helper'

# As a user
# I want to view a list of all available meetups
# So that I can get together with people with similar interests
# 
# Acceptance Criteria:
#
# On the meetups index page, I should see the name of each meetup.
# Meetups should be listed alphabetically.

feature "user views all meetups" do

  let(:meetups) do
    Meetup.create(title: 'Free Code Camp DC', location: 'Washington, DC', description: 'Learning full-stack Javascript together', creator: 'Quincy Larson')
    Meetup.create(title: 'Alexandria Code & Coffee', location: 'Alexandria, VA', description: 'Good coffee, good people.', creator: 'Robbie the Geek')
    Meetup.create(title: 'Node.DC', location: 'Arlington, VA', description: 'Learning and practicing full-stack javascript. Great drinks and snacks.', creator: '')
    Meetup.create(title: 'Arlington Ruby', location: 'Arlington, VA', description: 'Wednesday meetups for speakers - and drinks afterward.', creator: 'Alex')
    Meetup.create(title: 'Civic Hack Night', location: 'Washington, DC', description: 'Getting together for civic projects.', creator: 'Jess Garson')
  end

  scenario "visits index" do

    meetups
    visit '/'
    expect(page).to have_content "Alexandria Code & Coffee - Alexandria, VA\n  \n    Arlington Ruby - Arlington, VA"
  end

end
