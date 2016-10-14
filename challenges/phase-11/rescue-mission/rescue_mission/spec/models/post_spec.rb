require 'rails_helper'

RSpec.describe Post, type: :model do

  let!(:post_one) { Post.create(title: "Problems setting up Node.js server - Is this title long enough now?", description: "booboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboobooboo") }
  let!(:post_two) { Post.create(title: "How does this eRuby thing work, anyway? Let's take a deeper look", description: "hoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoohoo") }

  let!(:all_posts) { Post.list_all }
  let!(:first) { all_posts.first.title }
  let!(:last) { all_posts.last.title }

  it "returns posts in order from most recent to least" do
    
    expect(first).to eq "How does this eRuby thing work, anyway? Let's take a deeper look"
    expect(last).to eq "Problems setting up Node.js server - Is this title long enough now?"
  end
end
