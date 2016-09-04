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

  describe "#tie?" do

    it "returns false when all columns are not full" do
      game_board
      game_board.columns_status = {0 => false, 1 => false, 2 => false, 3 => false, 4 => false, 5 => false, 6 => false, 7 => false, 8 => false, 9 => false, }
      expect(game_board.tie?).to equal(false)
    end

    it "returns true when all columns are full" do
      game_board
      game_board.columns_status = {0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, }
      expect(game_board.tie?).to equal(true)
    end

    it "returns false if not all columns are full" do
      game_board
      game_board.columns_status = {0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => false, }
      expect(game_board.tie?).to equal(false)
    end
  end

  describe "#win?" do
    it "returns true when there are four of the same marker in a row, vertically" do
      game_board
      game_board.grid = [[" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 ["X", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 ["X", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 ["X", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 ["X", " ", " ", " ", " ", " ", " ", " ", " ", " "]]
      expect(game_board.win?).to eq(true)
    end
    it "returns true when there are four of the same marker in a row, horizontally" do
      game_board
      game_board.grid = [[" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 ["X", "X", "X", "X", " ", " ", " ", " ", " ", " "]]
      expect(game_board.win?).to eq(true)
    end
    it "returns true when there are four of the same marker in a row, horizontally AND there are other markers present" do
      game_board
      game_board.grid = [[" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
 ["O", "O", "X", "X", "X", "X", "O", "O", " ", " "]]
      expect(game_board.win?).to eq(true)
    end
    it "returns true when there are four of the same marker in a row, vertically AND there are other markers present" do
      game_board
      game_board.grid = [[" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["O", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["O", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["O", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["O", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["X", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["X", " ", " ", " ", " ", " ", " ", " ", " ", " "]]
      expect(game_board.win?).to eq(true)
    end
    it "returns FALSE when there are NO four of the same marker in a row, vertically AND there are other markers present" do
      game_board
      game_board.grid = [[" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["X", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["O", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["O", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["O", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["X", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["X", " ", " ", " ", " ", " ", " ", " ", " ", " "]]
      expect(game_board.win?).to eq(false)
    end
    it "returns FALSE when there are NOT four of the same marker in a row, vertically AND there are other markers present" do
      game_board
      game_board.grid = [[" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["X", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["O", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["O", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["O", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["X", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["X", " ", " ", " ", " ", " ", " ", " ", " ", " "]]
      expect(game_board.win?).to eq(false)
    end
    it "returns FALSE when there is only one marker present" do
      game_board
      game_board.grid = [[" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  ["X", " ", " ", " ", " ", " ", " ", " ", " ", " "]]
      expect(game_board.win?).to eq(false)
    end
    it "returns FALSE when there is no marker present" do
      game_board
      game_board.grid = [[" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "],
  [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "]]
      expect(game_board.win?).to eq(false)
    end
    it "returns true when the board is full and there is a vertically-aligned match" do
      game_board
      game_board.grid = [["O", "X", "O", "X", "O", "X", "O", "X", "O", "X"],
  ["X", "O", "X", "O", "O", "O", "X", "O", "X", "O"],
  ["O", "X", "O", "X", "O", "X", "O", "X", "O", "X"],
  ["X", "O", "X", "O", "O", "O", "X", "O", "X", "O"],
  ["O", "X", "O", "X", "O", "X", "O", "X", "O", "X"],
  ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O"],
  ["O", "X", "O", "X", "O", "X", "O", "X", "O", "X"],
  ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O"],
  ["O", "X", "O", "X", "O", "X", "O", "X", "O", "X"],
  ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O"]]
      expect(game_board.win?).to eq(true)
    end
    it "returns true when the board is full and there is a horizontally-aligned match" do
      game_board
      game_board.grid = [["O", "X", "X", "X", "X", "X", "O", "X", "O", "X"],
  ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O"],
  ["O", "X", "O", "X", "O", "X", "O", "X", "O", "X"],
  ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O"],
  ["O", "X", "O", "X", "O", "X", "O", "X", "O", "X"],
  ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O"],
  ["O", "X", "O", "X", "O", "X", "O", "X", "O", "X"],
  ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O"],
  ["O", "X", "O", "X", "O", "X", "O", "X", "O", "X"],
  ["X", "O", "X", "O", "X", "O", "X", "O", "X", "O"]]
      expect(game_board.win?).to eq(true)
    end
  end

end
