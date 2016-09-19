require 'spec_helper'

feature 'user sees actors' do
  scenario 'sees actors' do
    db_connection do |conn|
      sql_query = "INSERT INTO actors (name) VALUES ($1)"
      data = ["Jennifer Lawrence"]
      conn.exec_params(sql_query, data)
    end

    visit "/actors"
    expect(page).to have_content("Jennifer Lawrence")
  end

  scenario 'sees actors in alphabetical order' do
    db_connection do |conn|
      sql_query = "INSERT INTO actors (name) VALUES ($1)"

      data_1 = ["Jennifer Lawrence"]
      conn.exec_params(sql_query, data_1)

      data_2 = ["Jennifer Lopez"]
      conn.exec_params(sql_query, data_2)
    end

    visit "/actors"
    first_actress_position = page.body.index("Jennifer Lawrence")
    last_actress_position = page.body.index("Jennifer Lopez")
    expect(first_actress_position).to be < last_actress_position
  end
end
