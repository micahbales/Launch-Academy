require 'spec_helper'

feature 'user sees movie details' do
  before(:each) do
    db_connection do |conn|
      sql_query_1 = "INSERT INTO actors (name) VALUES ($1) RETURNING id"
      data_1 = ["Jennifer Lawrence"]
      actor_id = conn.exec_params(sql_query_1, data_1).first["id"]

      sql_query_2 = "INSERT INTO genres (name) VALUES ($1) RETURNING id"
      data_2 = ["Action & Adventure"]
      genre_id = conn.exec_params(sql_query_2, data_2).first["id"]

      sql_query_3 = "INSERT INTO studios (name) VALUES ($1) RETURNING id"
      data_3 = ["Lionsgate Films"]
      studio_id = conn.exec_params(sql_query_3, data_3).first["id"]

      sql_query_4 = "INSERT INTO movies (title, year, rating, genre_id, studio_id) VALUES ($1, $2, $3, $4, $5) RETURNING id"
      data_4 = ["The Hunger Games: Catching Fire", 2013, 100, genre_id, studio_id]
      movie_id = conn.exec_params(sql_query_4, data_4).first["id"]

      sql_query_5 = "INSERT INTO cast_members (movie_id, actor_id, character) VALUES ($1, $2, $3) RETURNING id"
      data_5 = [movie_id, actor_id, "Katniss Everdeen"]
      conn.exec_params(sql_query_5, data_5)
    end
  end

  scenario "can get to a movie's details page through movies index page" do
    visit "/movies"
    click_link "The Hunger Games: Catching Fire"
    expect(page).to have_current_path "/movies/1"
  end

  scenario 'sees a movie with their year, rating, genre, and studio' do
    visit "/movies/1"
    expect(page).to have_content("The Hunger Games: Catching Fire")
    expect(page).to have_content("2013")
    expect(page).to have_content("100")
    expect(page).to have_content("Action & Adventure")
    expect(page).to have_content("Lionsgate Films")
  end

  scenario "can see the movies' characters and actors" do
    visit "/movies/1"
    expect(page).to have_content "Jennifer Lawrence"
    expect(page).to have_content "Katniss Everdeen"
  end

  scenario "actor names should be links to their show page" do
    visit "/movies/1"
    expect(page).to have_link("Jennifer Lawrence")
    expect(page).to have_css("a[href='/actors/1']")
  end
end

