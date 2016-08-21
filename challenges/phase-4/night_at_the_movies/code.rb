require 'time'

class Movie

  attr_reader :title, :genre, :start_time

  def initialize(row_hash)
    @title = row_hash[:title]
    @genre = row_hash[:genre]
    @time = Time.parse(row_hash[:start_time])
  end

  def showing_after?(arrival_time)
    :start_time >= Time.parse(arrival_time)
  end

  def comedy?
    @genre == "comedy"
  end

  def showing_between?(start, finish)
    @start_time.between?(Time.parse(start), Time.parse(finish))
  end

end

movies = [
  {title: "The Princess Bride", genre: "Comedy", start_time: "7:00PM"},
  {title: "Troll 2", genre: "Horror", start_time: "7:30PM"},
  {title: "Pet Cemetery", genre: "Horror", start_time: "8:15PM"},
  {title: "Flight of the Navigator", genre: "Adventure", start_time: "8:17PM"},
  {title: "Teen Witch", genre: "Comedy", start_time: "8:20PM"},
  {title: "The Goonies", genre: "Comedy", start_time: "8:30PM"},
  {title: "Better Off Dead", genre: "Comedy", start_time: "8:45PM"},
  {title: "Weekend at Bernies", genre: "Comedy", start_time: "9:00PM"},
  {title: "The Wizard", genre: "Adventure", start_time: "9:10PM"}
]
