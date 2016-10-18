require 'rails_helper'

RSpec.describe BoardGameCollection, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:board_game) }
end
