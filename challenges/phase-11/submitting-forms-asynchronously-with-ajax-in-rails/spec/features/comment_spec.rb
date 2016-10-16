require "rails_helper"

feature "comment spec" do
  let(:video) { create(:video) }

  scenario "create comment on video" do
    visit video_path(video)
    within "div.new-comment" do
      fill_in "Title", with: "Eh, it was alright."
      fill_in "Content", with: "You can probably skip this one."
      click_button "Create Comment"
    end
    expect(page).to have_content("Thank you for your input!")
  end

  scenario "video comment fields not filled out" do
    visit video_path(video)
    within "div.new-comment" do
      click_button "Create Comment"
    end
    expect(page).to have_content("There was an issue with your comment.")
    expect(page).to have_content("can't be blank")
  end
end
