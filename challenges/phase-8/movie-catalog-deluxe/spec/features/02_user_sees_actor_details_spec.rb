require 'spec_helper'

feature 'user sees actor details' do
  before(:each) do
    db_connection do |conn|
      sql_query_1 = "INSERT INTO actors (name) VALUES ($1) RETURNING id"
      data_1 = ["Jennifer Lawrence"]
      actor_id = conn.exec_params(sql_query_1, data_1).first["id"]

      sql_query_2 = "INSERT INTO genres (name) VALUES ($1) RETURNING id"
      data_2 = ["Action & Adventure"]
      genre_id = conn.exec_params(sql_query_2, data_2).first["id"]

      sql_query_3 = "INSERT INTO movies (title, year, genre_id) VALUES ($1, $2, $3) RETURNING id"
      data_3 = ["The Hunger Games: Catching Fire", "2013", genre_id]
      movie_id = conn.exec_params(sql_query_3, data_3).first["id"]

      sql_query_4 = "INSERT INTO cast_members (movie_id, actor_id, character) VALUES ($1, $2, $3) RETURNING id"
      data_4 = [movie_id, actor_id, "Katniss Everdeen"]
      conn.exec_params(sql_query_4, data_4)
    end
  end

  scenario "can get to an actor's details page through actors index page" do
    visit "/actors"
    click_link "Jennifer Lawrence"
    expect(page).to have_current_path("/actors/1")
  end

  scenario "can see actor details" do
    visit "/actors/1"
    expect(page).to have_content("Jennifer Lawrence")
  end

  scenario "can see actors' movies and characters" do
    visit "/actors/1"
    expect(page).to have_content("The Hunger Games: Catching Fire")
    expect(page).to have_content("Katniss Everdeen")
  end

  scenario "the movie names should be links to the movie's show page" do
    visit "/actors/1"
    expect(page).to have_link("The Hunger Games: Catching Fire")
    expect(page).to have_css("a[href='/movies/1']")
  end
end
