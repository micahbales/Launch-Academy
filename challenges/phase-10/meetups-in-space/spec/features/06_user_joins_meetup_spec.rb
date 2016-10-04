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

feature "" do

  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

  xscenario "" do

  end

  xscenario "" do

  end

end
