require 'rails_helper'
require 'pry'

RSpec.describe Post, type: :model do

  Post.create(title: "Problems setting up Node.js server", description: "boo")
  Post.create(title: "How does this eRuby thing work, anyway?", description: "hoo")

  let!(:all_posts) { Post.list_all }
  let!(:first) { all_posts.first.title }
  let!(:last) { all_posts.last.title }

  it "returns posts in order from most recent to least" do
    expect(first).to eq "How does this eRuby thing work, anyway?"
    expect(last).to eq "Problems setting up Node.js server"
  end
end
