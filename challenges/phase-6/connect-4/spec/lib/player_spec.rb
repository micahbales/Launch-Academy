require "spec_helper"

RSpec.describe Player do
  let(:player1) { Player.new("Bob", "X") }
  let(:player2) { Player.new("Sue", "0") }
  it "initializes with a name and marker (X or O)" do
    expect(player1.name).to eq("Bob")
    expect(player1.marker).to eq("X")
    expect(player2.name).to eq("Sue")
    expect(player2.marker).to eq("0")
  end
end
