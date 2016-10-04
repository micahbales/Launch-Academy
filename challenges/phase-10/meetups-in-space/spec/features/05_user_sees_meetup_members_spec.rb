require "spec_helper"

# As a user
# I want to see who has already joined a meetup
# So that I can see if any of my friends have joined
# Acceptance Criteria:
#
# On a meetup's show page, I should see a list of the members that have joined the meetup.
# I should see each member's avatar and username.

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
