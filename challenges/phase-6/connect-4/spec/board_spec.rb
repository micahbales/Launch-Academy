require "spec_helper"

RSpec.describe Board do
  it 'prints a board grid where players can make their moves' do
    expect(Board.new.display_board).to eq("|                   |
    |                   |
    |                   |
    |                   |
    |                   |
    |                   |
    |                   |
    |                   |
    |                   |
    |                   |
     A B C D E F G H I J ")
  end
end
