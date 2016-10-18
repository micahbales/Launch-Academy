require 'rails_helper'

RSpec.describe BoardGame, type: :model do
  it { should have_many(:board_game_collections) }
  it { should have_many(:users).through(:board_game_collections) }

  it { should have_valid(:name).when('Ticket to Ride', 'Carcassonne') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:publisher).when('Days of Wonder', 'Z-man Games') }
  it { should_not have_valid(:publisher).when(nil, '') }

  it { should have_valid(:min_players).when(1, 2, 3) }
  it { should_not have_valid(:min_players).when(0, -1, -2) }

  it { should have_valid(:max_players).when(1, 2, 3) }
  it { should_not have_valid(:max_players).when(0, -1, -2) }
end
