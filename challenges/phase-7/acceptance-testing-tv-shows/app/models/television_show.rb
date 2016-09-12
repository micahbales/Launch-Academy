class TelevisionShow
  GENRES = ["Action", "Mystery", "Drama", "Comedy", "Fantasy"]

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
