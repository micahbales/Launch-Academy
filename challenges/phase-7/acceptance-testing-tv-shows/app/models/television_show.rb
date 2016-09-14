class TelevisionShow
  GENRES = ["Action", "Mystery", "Drama", "Comedy", "Fantasy"]

  attr_reader :title, :network, :starting_year, :synopsis, :genre, :all

  def initialize(title, network, starting_year, synopsis, genre)
    @title = title
    @network = network
    @starting_year = starting_year
    @synopsis = synopsis
    @genre = genre
  end

  def errors
    []
  end

  def self.all
    all_shows = []
    CSV.foreach("television-shows.csv", {:headers=>:first_row}) do |row|
      show = {}
      show[:title] = row[0]
      show[:network] = row[1]
      show[:starting_year] = row[2]
      show[:synopsis] = row[3]
      show[:genre] = row[4]
      all_shows << show
    end
    all_shows
  end

  def self.valid?(title, network, starting_year, synopsis, genre)
    [title, network, starting_year, synopsis, genre].each do |item|
      if item == "" || item.nil?
        return false
      end
    end
    true
  end

  def self.repeat?(title)
    CSV.foreach("television-shows.csv") do |row|
      if row.include?(title)
        return true
      end
    end
    false
  end
end
