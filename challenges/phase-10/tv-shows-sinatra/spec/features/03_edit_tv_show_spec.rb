require "spec_helper"

feature "user edits existing show" do
# As a TV fanatic
# I want to edit an existing show
# So that I can correct any foolish mistakes
#
# Acceptance Criteria:
# * Editing a show provides a pre-populated form for each field.
# * Submitting the edit form will update a show if all validations pass.
# * The user is redirected to the details page for that show if successfully updated.
# * If the update fails any validations, re-display the form with the appropriate error messages.

  scenario "successfully edit all required fields in TV show" do

    the_wire = TelevisionShow.create!({
        title: "The Wire", network: "HBO",
        starting_year: 2004, genre: "Drama"
      })

    visit('/television_shows')
    click_link('The Wire (HBO)')
    click_link('edit_entry')
    fill_in('title', :with => 'Breaking Bad')
    fill_in('network', :with => 'Netflix')
    fill_in('starting_year', :with => '2009')
    click_button('Update TV Show')
    expect(page).to have_content('Breaking Bad (Netflix)')
  end

  pending "successfully edit TV show year" do
    visit('/television_shows')
    click('Breaking Bad (Netflix)')
    click('Edit entry')
    fill_in('starting_year', :with => '2014')
    click_button('Update TV Show')
    expect(page).to have_content('Breaking Bad (Netflix)')
    expect(page).to have_content('2014')
  end

end
