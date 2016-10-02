require "spec_helper"

feature "user views list of TV shows" do
  # As a TV fanatic
  # I want to view a list of TV shows
  # So I can find new shows to watch
  #
  # Acceptance Criteria:
  # * I can see the names and networks of all TV shows

  scenario "view list of TV shows" do
    # First create some sample TV shows
    game_of_thrones = TelevisionShow.create!({
        title: "Game of Thrones", network: "HBO",
        starting_year: 2011, genre: "Fantasy"
      })

    married_with_children = TelevisionShow.create!({
        title: "Married... with Children", network: "Fox",
        starting_year: 1987, ending_year: 1997,
        genre: "Comedy"
      })

    # The user visits the index page
    visit "/television_shows"

    # And should see both TV shows listed (just the title and network)
    expect(page).to have_content("Game of Thrones (HBO)")
    expect(page).to have_content("Married... with Children (Fox)")
  end

  # As a TV fanatic
  # I want to view the details for a TV show
  # So I can find learn more about it

  # Acceptance Criteria:
  # * I can see the title, network, start and end year, genre, and synopsis
  #   for a show.
  # * If the end year is not provided it should indicate that the show is still
  #   running.

  scenario "view details for a TV show" do

    game_of_thrones = TelevisionShow.create!({
        title: "Game of Thrones", network: "HBO",
        starting_year: 2011, genre: "Fantasy"
      })

    married_with_children = TelevisionShow.create!({
        title: "Married... with Children", network: "Fox",
        starting_year: 1987, ending_year: 1997,
        genre: "Comedy"
      })

    visit("/television_shows/#{game_of_thrones.id}")
    expect(page).to have_content("Game of Thrones")
    expect(page).to have_content("Fantasy")
    expect(page).to have_content("2011")
    expect(page).to have_content("HBO")

    visit ("/television_shows/#{married_with_children.id}")
    expect(page).to have_content("Married... with Children")
    expect(page).to have_content("Fox")
    expect(page).to have_content("1987")
    expect(page).to have_content("1997")
    expect(page).to have_content("Comedy")

  end

  scenario "view details for a TV show with missing information" do

    visit('/television_shows/new')
    fill_in('network', :with => 'Netflix')
    fill_in('starting_year', :with => '1997')
    click_button('Add TV Show')
    expect(page).to have_content("Title can't be blank")

    visit('/television_shows/new')
    fill_in('title', :with => 'House of Cards')
    fill_in('starting_year', :with => '1997')
    click_button('Add TV Show')
    expect(page).to have_content("Network can't be blank")

    visit('/television_shows/new')
    fill_in('title', :with => 'House of Cards')
    fill_in('network', :with => 'Netflix')
    click_button('Add TV Show')
    expect(page).to have_content("Starting year can't be blank")
  end
end
