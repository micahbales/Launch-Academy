require "simplecov"
SimpleCov.start
require "pry"
require_relative "../code"

RSpec.describe "perimeter" do
  it "returns 20 for a square with a width of 5" do
    expect(perimeter(5)).to eq(20)
  end

  it "returns 30 for a rectangle with a width of 5 and a length of 10" do
    expect(perimeter(5, 10)).to eq(30)
  end
end

describe "average" do
  it "returns the sum of each grade in an array" do
    expect(average([40,50,60])).to eq(50)
  end
end

describe "rankings" do
  it "takes an array of stduents and returns a string list, preceded by students' rank (e.g. 1., 2., etc)" do
    expect(rankings(["Bob", "Billy", "Sally"])).to eq("1. Bob\n2. Billy\n3. Sally\n")
  end
end

describe "greet" do
  it "says 'Hi Mom!' when given only the first argument as 'Mom'" do
    expect(greet("Mom")).to eq(puts "Hi Mom!")
  end

  it "says 'Ciao Bella!' when given two arguments: 'Bella' and 'italian'" do
    expect(greet("Bella", "italian")).to eq(puts "Ciao Bella!")
  end

  it "says 'Hola Amigo!' when given two arguments: 'Amigo' and 'spanish'" do
    expect(greet("Amigo", "spanish")).to eq(puts "Hola Amigo!")
  end

  it "says 'Bonjour Monsieur!' when given two arguments: 'Monsieur' and 'french'" do
    expect(greet("Monsieur", "french")).to eq(puts "Bonjour Monsieur!")
  end

end

describe "print_puzzle" do
  it "prints 'o' and 't' out of the word 'out'" do
    expect{print_puzzle("out", ["o", "t"])}.to output("o _ t ").to_stdout
  end
end

describe "divisible_by_three" do
  it "returns true if 9 divides evenly into 3" do
    expect(divisible_by_three(9)).to eq(true)
  end
end

describe "divisible_by_three" do
  it "returns false if 7 does not divide evenly into 3" do
    expect(divisible_by_three(7)).to eq(false)
  end
end

describe "perfect_square?" do
  it "throws error when number entered is less than one" do
    expect{perfect_square?(0)}.to raise_error(ArgumentError)
  end
end

describe "perfect_square?" do
  it "returns true when number entered can square perfectly" do
    expect(perfect_square?(4)).to eq(true)
  end
end

describe "perfect_square?" do
  it "returns false when number entered cannot square perfectly" do
    expect(perfect_square?(7)).to eq(false)
  end
end
