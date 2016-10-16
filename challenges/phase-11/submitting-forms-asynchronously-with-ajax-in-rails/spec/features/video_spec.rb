require "rails_helper"

feature "video spec" do
  let!(:format) { create(:format, name: "VHS") }
  let!(:genre) { create(:genre, name: "Horror") }

  scenario "add video" do
    visit new_video_path

    fill_in "Title", with: "Ash vs. Army of Darkness"
    fill_in "Description", with: <<-DESCRIPTION
      Ash finds himself trapped in medieval times. He must quest for the
      Necronomicon, a book of evil which can return him to his time.
      Unfortunately, he releases the evil trapped inside the book and
      unleashes an army of the dead.
    DESCRIPTION
    fill_in "Year", with: 1992
    select "VHS", from: "Format"
    select "Horror", from: "Genre"
    click_button "Create Video"

    expect(page).to have_content("New video created.")
  end
end
