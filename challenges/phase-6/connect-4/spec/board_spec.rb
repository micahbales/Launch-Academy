require "spec_helper"

RSpec.describe Board do
  let(:game_board) { Board.new }
  it 'prints a board grid where players can make their moves' do
    expect(game_board.display_board).to eq("|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
|                   |
 A B C D E F G H I J")
  end

  describe "#initialize" do
    it "has two attributes: rows and cols, which default to 10 and 19, respectively" do
      expect(game_board.rows).to eq(10)
      expect(game_board.cols).to eq(10)
    end
  end

  describe "#drop_marker" do
    it "inserts X marker into grid" do
      game_board.drop_marker("G", "X")
      expect(game_board.grid.flatten).to include("X")
  end
   it "inserts O marker into grid" do
     game_board.drop_marker("C", "O")
     expect(game_board.grid.flatten).to include("O")
    end
  end
end
