require 'spec_helper'

feature 'user sees movies' do
  before(:each) do
    db_connection do |conn|
      sql_query_1 = "INSERT INTO genres (name) VALUES ($1) RETURNING id"
      data_1 = ["Action & Adventure"]
      genre_id = conn.exec_params(sql_query_1, data_1).first["id"]

      sql_query_2 = "INSERT INTO studios (name) VALUES ($1) RETURNING id"
      data_2 = ["Lionsgate Films"]
      studio_id = conn.exec_params(sql_query_2, data_2).first["id"]

      sql_query_3 = "INSERT INTO movies (title, year, rating, genre_id, studio_id) VALUES ($1, $2, $3, $4, $5) RETURNING id"
      data_3 = ["The Hunger Games: Catching Fire", 2013, 100, genre_id, studio_id]
      conn.exec_params(sql_query_3, data_3)

      sql_query_4 = "INSERT INTO movies (title, year, genre_id) VALUES ($1, $2, $3) RETURNING id"
      data_4 = ["Avatar", 2009, genre_id]
      conn.exec_params(sql_query_4, data_4)
    end
  end

  scenario 'sees movies with their year, rating, genre, and studio' do
    visit "/movies"
    expect(page).to have_content("Avatar")
    expect(page).to have_content("2009")
    expect(page).to have_content("Action & Adventure")

    expect(page).to have_content("The Hunger Games: Catching Fire")
    expect(page).to have_content("2013")
    expect(page).to have_content("100")
    expect(page).to have_content("Action & Adventure")
    expect(page).to have_content("Lionsgate Films")
  end

  scenario 'sees movies in alphabetical order' do
    visit "/movies"
    first_movie_position = page.body.index("Avatar")
    last_movie_position = page.body.index("The Hunger Games: Catching Fire")
    expect(first_movie_position).to be < last_movie_position
  end
end

