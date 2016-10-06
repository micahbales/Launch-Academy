require "spec_helper"

# As a user
# I want to join a meetup
# So that I can partake in this meetup
#
# Acceptance Criteria:
#
# On a meetup's show page, there should be a button to join the meetup if I am not signed in or if I am signed in, but I am not a member of the meetup.
# If I am signed in and I click the button, I should see a message that says that I have joined the meetup and I should be added to the meetup's members list.
# If I am not signed in and I click the button, I should see a message which says that I must sign in.

feature "User joins meetup" do

  let(:meetup_1) { Meetup.create(title: "Free Code Camp", location: "Washington, DC", description: "Free Code, without the camp", creator: "Quincy Larson") }

  let(:micah) { User.create(provider: "github", uid: "0", username: "micahbales",
  email: "micahbales@gmail.com",
  avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400") }

  let!(:joins) { MeetupUser.create(meetup: meetup_1, user: micah) }

  scenario "signed-in user clicks button to join" do
    sign_in_as micah
    visit "/meetups/#{meetup_1.id}"
    click_button "Join"
    expect(page).to have_content "Thanks for joining this meetup!"

  end

  scenario "anonymous user clicks button to join" do
    visit "/meetups/#{meetup_1.id}"
    click_button "Join"
    expect(page).to have_content "You need to be signed in to join this meetup"
  end

end
