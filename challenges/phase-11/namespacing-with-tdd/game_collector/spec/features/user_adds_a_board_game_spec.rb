require 'rails_helper'

feature 'user adds a board game', %q(

  As a user
  I want to add board games
  So that I can keep track of my collection

) do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'add a game', focus: true do
    login_as(user)
    visit new_board_game_path

    fill_in 'Name', with: 'Cards Against Humanity'
    fill_in 'Publisher', with: 'Kickstarted'
    fill_in 'Description', with: 'A truly vile game, but fun!'
    fill_in 'Release date', with: '2010/01/30'
    fill_in 'Min players', with: 3
    fill_in 'Max players', with: 20
    click_on 'Create Board game'

    expect(page).to have_content('Board game was successfully created.')
    expect(page).to have_content('Cards Against Humanity')
  end

end
