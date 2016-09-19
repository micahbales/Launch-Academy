require "spec_helper"

RSpec.describe Actors do
  let (:actors) { ['Daniel Clark',
 'Darla Vandenbossche',
 'Eileen Pedde',
 'Ellen Page',
 'J.K. Simmons',
 'Jason Bateman',
 'Jennifer Garner',
 'Maggie Moore',
 'Michael Cera',
 'Olivia Thirlby'].sort }
  let (:actor) { 'Maggie Moore' }

  describe "#self.list" do

    it "returns an array of 10 actors" do
      expect(Actors.list).to eq(actors)
    end
  end

  describe "#self.movies_with" do

    it "returns an array of details for a particular actor" do
      expect(Actors.movies_with(actor)).to eq ([{"title"=>"American Splendor", "year"=>"2003", "genre"=>"Drama"}, {"title"=>"The Visitor", "year"=>"2008", "genre"=>"Drama"}])
    end
  end
end
