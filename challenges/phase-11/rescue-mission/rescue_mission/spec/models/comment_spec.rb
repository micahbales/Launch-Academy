require 'rails_helper'

RSpec.describe Comment, type: :model do

  let!(:post1) { Post.create!(title: "Problems setting up Node.js server - Is this title long enough now?", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam.") }

  let!(:comment1) { Comment.create!(post: post1, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam.") }
  let!(:comment2) { Comment.create!(post: post1, description: "Pellentesque a velit accumsan, cursus urna in, fermentum sem. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat.") }

  let!(:all_comments) { Comment.list_all }
  let!(:first) { all_comments.first.description }
  let!(:last) { all_comments.last.description }

  it "returns comments in order from least recent to most recent" do

    expect(first).to eq "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat. Phasellus sollicitudin lacinia ipsum, eu vulputate nibh venenatis sit amet. Donec tortor augue, sagittis in sollicitudin at, fermentum a quam."
    expect(last).to eq "Pellentesque a velit accumsan, cursus urna in, fermentum sem. Fusce vitae convallis eros. Vivamus fermentum turpis vitae diam rhoncus pulvinar nec ut erat."
  end
end
